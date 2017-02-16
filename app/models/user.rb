class User < ActiveRecord::Base
  attr_accessor :activation_token
  before_create :create_activation_digest
  validates :firstname, presence:true, length: {maximum:55}
  validates :lastname, presence:true, length: {maximum:55}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  
  private
 
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
  
end