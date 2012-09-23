# DB Information
# Table name: Graphs
# Each entry contains:
#   id : integer, unique
#   page_id : integer
#   date : integer
#   view_count :integer

class Graph < ActiveRecord::Base
  attr_accessible :date, :page_id, :view_count
  belongs_to :page
  end
