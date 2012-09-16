class Page < ActiveRecord::Base
  attr_accessible :count, :user_id, :avg_time
  belongs_to :user
end
