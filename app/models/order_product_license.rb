# == Schema Information
#
# Table name: order_product_licenses
#
#  id         :bigint(8)        not null, primary key
#  order_id   :integer
#  product_id :integer
#  user_id    :integer
#  license    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderProductLicense < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :product

  validates_presence_of :license
  validates_uniqueness_of :license
end
