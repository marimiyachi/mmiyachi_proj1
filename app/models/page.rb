# DB Information
# Table name: Pages
# Each entry contains:
#   id : integer, unique
#   user_id : integer
#   count : integer
#   avg_time : integer
#   geo : string

class Page < ActiveRecord::Base
  attr_accessible :count, :avg_time, :geo
  validates :user_id, presence: true
  belongs_to :user
  has_many :graphs, dependent: :destroy
end
