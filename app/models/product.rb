class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :references, through: :associations
  validates :name, presence: true
end