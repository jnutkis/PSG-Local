class Vendor < ActiveRecord::Base
  has_many :products
  extend FriendlyId
  friendly_id :name
  validates :name, presence: true
  validates :active, presence: true
end