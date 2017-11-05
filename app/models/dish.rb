class Dish < ApplicationRecord
	# associations
  belongs_to :restaurant
  
  # validations
  validates :name, :price, :restaurant_id, presence: true
end
