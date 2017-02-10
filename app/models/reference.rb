class Reference < ActiveRecord::Base
  has_many :products, through: :associations
  extend FriendlyId
  friendly_id :short_ref
  validates :full_ref, presence: true
  validates :short_ref, presence: true
end