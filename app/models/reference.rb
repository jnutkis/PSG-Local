class Reference < ActiveRecord::Base
  validates :full_ref, presence: true
  validates :short_ref, presence: true
end