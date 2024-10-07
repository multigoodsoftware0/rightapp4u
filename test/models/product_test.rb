# == Schema Information
#
# Table name: products
#
#  id                       :bigint(8)        not null, primary key
#  title                    :string(255)
#  description              :text(65535)
#  slug                     :string(255)
#  sku                      :string(255)
#  deal_active              :boolean
#  product_type             :string(255)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  regular_price            :float(24)
#  sale_price               :float(24)
#  slogan                   :string(255)
#  snippet                  :text(65535)
#  tldr                     :text(65535)
#  benefits                 :text(65535)
#  total_licenses_available :integer
#  published                :boolean
#  coming_soon              :boolean
#  name                     :string(255)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
