class Vendor < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  validates :name, presence: true
  validates :active, presence: true
end