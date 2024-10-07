module Account
  class OrdersController < ApplicationController

    before_action :authenticate_user!
    before_action :no_access_to_other_user_orders, only: [:show, :refund]
    before_action :no_refund_if_order_is_already_refunded, only: [:refund]
    before_action :no_refund_if_order_is_older_than_60_days, only: [:refund]

    def index
      @orders = Order.where(:user => current_user).order(created_at: :desc)
    end

    def show
      @order = Order.find(params[:id])
    end

    # def invoice
    #   @order = Order.find(params[:order_id])
    # end

    def refund
      payment_id = Order.find_by_id(params[:order_id]).payment_id
      @order = Order.process_refund(payment_id)
      flash[:notice] = "Order successfully refunded"
      OrderMailer.with(order: @order, user: current_user).order_refunded.deliver_later
      redirect_to account_orders_path
    end

    private
    def no_access_to_other_user_orders
      if params[:id]
        @order = Order.find(params[:id])
      else
        @order = Order.find(params[:order_id])
      end
      if @order.user != current_user
        flash[:alert] = "You don't have access to this!"
        redirect_to account_orders_path
      end
    end

    def no_refund_if_order_is_already_refunded
      @order = Order.find(params[:order_id])
      if @order.status == 'refunded'
        flash[:alert] = "Sorry, this order is already refunded"
        redirect_to account_orders_path
      end
    end

    def no_refund_if_order_is_older_than_60_days
      @order = Order.find(params[:order_id])
      if @order.created_at + 60.days < Time.now
        flash[:alert] = "Sorry, you can NOT get refund for this order"
        redirect_to account_orders_path
      end
    end

  end
end
