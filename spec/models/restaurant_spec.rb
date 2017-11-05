require 'rails_helper'

describe Restaurant do 
	it "should be valid" do
		restaurant = Restaurant.new(name: 'Restaurant 1')
		expect(restaurant).to be_valid
	end
	
	it "should be invalid without a name" do
		restaurant = Restaurant.new(name: nil)
		restaurant.valid?
		expect(restaurant.errors[:name]).to include("can't be blank")
	end
end