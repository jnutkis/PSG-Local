class User < ActiveRecord::Base
  attr_accessor :activation_token, :temporary_token
  before_create :create_activation_digest, :create_temp_digest
  before_save :downcase_email
  before_validation :user_defaults
  validates :firstname, presence:true, length: {maximum:55}
  validates :lastname, presence:true, length: {maximum:55}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :password, presence:true, length: { minimum: 8 }, allow_nil: true
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
   def User.temp_token
    SecureRandom.urlsafe_base64(12)
  end
  
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Activates an account.
  def activate
    update_attribute(:active,    1)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  
  
  
  
  private
    def downcase_email
      self.email = email.downcase if email.present?
    end
 
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
    
    def create_temp_digest
      self.temporary_token = User.temp_token
      self.password_digest = User.digest(temporary_token)
    end
      
    def user_defaults
      if self.password_digest.nil?
        self.update_attribute(:admin, 1)
        self.update_attribute(:password, SecureRandom.urlsafe_base64)
      end
    end
  
end