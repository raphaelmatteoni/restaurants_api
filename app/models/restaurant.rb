class Restaurant < ApplicationRecord
	# associations
	has_many :dishes, dependent: :destroy

	# validations
	validates :name, presence: true
end