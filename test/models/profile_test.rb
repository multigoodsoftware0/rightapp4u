# == Schema Information
#
# Table name: profiles
#
#  id           :bigint(8)        not null, primary key
#  address1     :string(255)
#  address2     :string(255)
#  city         :string(255)
#  state        :string(255)
#  pincode      :string(255)
#  mobile       :string(255)
#  company_name :string(255)
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
