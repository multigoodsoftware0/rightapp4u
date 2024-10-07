# == Schema Information
#
# Table name: orders
#
#  id         :bigint(8)        not null, primary key
#  price      :float(24)
#  status     :string(255)
#  payment_id :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  include OrderConcerns::Razorpay
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  has_many :order_product_licenses

  [:authorized, :captured, :refunded, :error].each do |scoped_key|
    scope scoped_key, -> { where('LOWER(status) = ?', scoped_key.to_s.downcase) }
  end

  class << self
    def process_razorpayment(params, cart)
      razorpay_pmnt_obj = fetch_payment(params[:payment_id])
      status = fetch_payment(params[:payment_id]).status
      if status == "authorized"
        razorpay_pmnt_obj.capture!({amount: cart.total_price*100})
        razorpay_pmnt_obj = fetch_payment(params[:payment_id])
        params.merge!({status: razorpay_pmnt_obj.status, price: cart.total_price})
        order = Order.new(params)
        order.add_line_items_from_cart(cart) #current cart
        return order
      else
        raise StandardError, "UNABLE to capture payment"
      end
    end

    def process_refund(payment_id)
      fetch_payment(payment_id).refund!
      record = Order.find_by_payment_id(payment_id)
      record.update_attributes(status: fetch_payment(payment_id).status)
      return record
    end

    def filter(params)
      scope = params[:status] ? Order.send(params[:status]) : Order.authorized
      return scope
    end

  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def to_param
    # require 'securerandom'
    random_string = (0...8).map { (65 + rand(26)).chr }.join #SecureRandom.hex
    "#{id}#{random_string}"
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price.to_i }
  end

  def quantity
    line_items.sum(:quantity)
  end

  def to_s
    "#{self.id}" + " - " + "#{self.payment_id}"
  end

end
