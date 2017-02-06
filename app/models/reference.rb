class Reference < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_ref
  validates :full_ref, presence: true
  validates :short_ref, presence: true
end