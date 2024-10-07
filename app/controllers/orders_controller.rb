class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  include CurrentCart
  before_action :set_cart, only: [:new, :create, :purchase_status]
  before_action :ensure_cart_isnt_empty, only: :new
  before_action :authenticate_user!, except: [:purchase_status, :refund]

  def purchase_status
    begin
      @order = Order.process_razorpayment(payment_params, @cart)
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        flash[:notice] = "Thanks for your order! Check your inbox for further details."
        OrderMailer.with(order: @order, user: current_user).order_placed.deliver_later
      end
    rescue Exception
      flash[:alert] = "Unable to process payment."
    end
    redirect_to root_path
  end

  private
    def payment_params
      p = params.permit(:payment_id, :user_id, :price, :razorpay_payment_id)
      p.merge!({payment_id: p.delete(:razorpay_payment_id) || p[:payment_id]})
      p
    end

    def filter_params
      params.permit(:status, :page)
    end

    def ensure_cart_isnt_empty
      if @cart.line_items.empty?
        redirect_to store_index_url, notice: 'Your cart is empty'
      end
    end

end
