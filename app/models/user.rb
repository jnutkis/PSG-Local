class User < ActiveRecord::Base
  validates :firstname, presence:true, length: {maximum:30}
  validates :lastname, presence:true, length: {maximum:30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end