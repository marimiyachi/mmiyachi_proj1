class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation

  validates :name, :presence => true, :length => { :maximum => 50}, :uniqueness => true
  validates :password, :presence => true, :length => { :maximum => 6}
  validates :password_confirmation, :presence => true

  has_many :pages
end
