class Page < ActiveRecord::Base
  attr_accessible :count, :avg_time, :geo
  validates :user_id, presence: true
  belongs_to :user
end
