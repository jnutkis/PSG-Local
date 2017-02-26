class Vendor < ActiveRecord::Base
  has_many :products
  extend FriendlyId
  friendly_id :name
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :email, length: { maximum: 80 }, allow_nil: true
  has_attached_file :image, 
    default_url: "/images/:style/missing.png",
    :path => ":rails_root/public/system/:id/:filename",
    :url => "/system/:id/:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end