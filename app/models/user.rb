class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  before_save :create_token

  validates :name, :presence => true, :length => { :maximum => 50}, :uniqueness => true
  validates :password, :presence => true, :length => { :maximum => 6}
  validates :password_confirmation, :presence => true

  has_many :pages

  private
    def create_token
      self.token = SecureRandom.urlsafe_base64
    end
end
