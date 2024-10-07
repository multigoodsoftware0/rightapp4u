class OrderMailer < ApplicationMailer

  default from: 'no-reply@rightapp4u.com'

  def order_placed
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: "You have successfully placed an order no: #{@order.id}")
  end

  def order_refunded
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: "You have successfully placed a REFUND for your order no: #{@order.id}")
  end

end
