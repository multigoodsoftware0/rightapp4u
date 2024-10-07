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

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
