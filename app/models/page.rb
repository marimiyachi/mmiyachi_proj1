class Page < ActiveRecord::Base
  attr_accessible :count, :user_id
  belongs_to :user
end
