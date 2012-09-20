class Page < ActiveRecord::Base
  attr_accessible :count, :user_id, :avg_time
  validates :user_id, presence: true
  belongs_to :user
end
