class Vendor < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  validates :name, presence: true
  validated :active, presence: true
end