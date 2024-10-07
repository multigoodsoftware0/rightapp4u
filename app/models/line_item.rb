# == Schema Information
#
# Table name: line_items
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)
#  cart_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#  order_id   :bigint(8)
#

class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
  belongs_to :cart

  def total_price
    product.sale_price * quantity
  end

end
