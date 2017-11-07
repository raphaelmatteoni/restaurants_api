class Restaurant < ApplicationRecord
	# associations
	has_many :dishes, dependent: :destroy

	# validations
	validates :name, presence: true

	# class methdos
	scope :by_name, -> name { where("name ILIKE '%#{name}%'") }
end