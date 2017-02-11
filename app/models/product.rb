class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :associations
  has_many :references, :through => :associations
  extend FriendlyId
  friendly_id :id
  validates :name, presence: true
end