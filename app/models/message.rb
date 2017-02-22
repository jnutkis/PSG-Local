class Message < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true, length: {maximum: 3000}
  
  # Sends message to support.
  def send_message_to_support
      MessageMailer.message_submitted(self).deliver_now
  end
 end