class User < ActiveRecord::Base
  validates :firstname, presence:true, length: {maximum:55}
  validates :lastname, presence:true, length: {maximum:55}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
end