# == Schema Information
#
# Table name: rating_caches
#
#  id             :bigint(8)        not null, primary key
#  cacheable_type :string(255)
#  cacheable_id   :bigint(8)
#  avg            :float(24)        not null
#  qty            :integer          not null
#  dimension      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, :polymorphic => true
end
