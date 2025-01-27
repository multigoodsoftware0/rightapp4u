# == Schema Information
#
# Table name: rates
#
#  id            :bigint(8)        not null, primary key
#  rater_id      :bigint(8)
#  rateable_type :string(255)
#  rateable_id   :bigint(8)
#  stars         :float(24)        not null
#  dimension     :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true

  #attr_accessible :rate, :dimension

end
