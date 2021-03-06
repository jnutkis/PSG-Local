class User < ActiveRecord::Base
  attr_accessor :activation_token, :temporary_token, :reset_token
  attr_readonly :email
  before_create :create_activation_digest
  before_validation :create_temp_digest, on: :create 
  before_save :downcase_email
  validates :firstname, presence:true, length: {maximum:55}
  validates :lastname, presence:true, length: {maximum:55}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_secure_password
  has_one_time_password
  validates :password, presence:true, allow_nil: true, :format => {:with => /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}\z/, message: "must be at least 8 characters and include at least one number, one uppercase letter, one lowercase letter, and one special character."}
  validates :vendor_id, presence: true
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def User.temp_token
    SecureRandom.urlsafe_base64(8)
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
    update_attribute(:admin, 1)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  # Check if user is locked out
   def locked_out?
      if !self.locked_at.nil?
        if self.locked_at < 15.minutes.ago
          return true
        end
      else
        return true
      end
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
    

      
  
end