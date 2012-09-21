class Graph < ActiveRecord::Base
  attr_accessible :date, :page_id, :view_count
  belongs_to :page
  end
