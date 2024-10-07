# == Schema Information
#
# Table name: overall_averages
#
#  id            :bigint(8)        not null, primary key
#  rateable_type :string(255)
#  rateable_id   :bigint(8)
#  overall_avg   :float(24)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class OverallAverage < ActiveRecord::Base
  belongs_to :rateable, :polymorphic => true
end

