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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
