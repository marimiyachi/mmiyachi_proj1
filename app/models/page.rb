class Page < ActiveRecord::Base
  attr_accessible :title, :visit_count
  belongs_to :site
end
