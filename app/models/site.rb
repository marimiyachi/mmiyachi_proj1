# == DB Information
# Table name: sites
# id    :integer    not null, primary key
# count :integer

class Site < ActiveRecord::Base
  attr_accessible :count
end
