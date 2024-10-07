# == Schema Information
#
# Table name: average_caches
#
#  id            :bigint(8)        not null, primary key
#  rater_id      :bigint(8)
#  rateable_type :string(255)
#  rateable_id   :bigint(8)
#  avg           :float(24)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true
end
