class Vendor < ActiveRecord::Base
  has_many :products
  extend FriendlyId
  friendly_id :name
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :email, length: { maximum: 80 }, allow_nil: true
end