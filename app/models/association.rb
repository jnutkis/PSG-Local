class Association < ActiveRecord::Base
  belongs_to :product
  belongs_to :reference
end