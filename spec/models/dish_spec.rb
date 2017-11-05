require 'rails_helper'

describe Dish do
  before(:each) {
		@restaurant = Restaurant.create(name: 'Restaurant 1')
  }


	it "should be valid" do
		dish = Dish.new(name: 'Dish 1', restaurant_id: @restaurant.id, price: 50)
		expect(dish).to be_valid
	end

	it "should be invalid without a restaurant_id" do
		dish = Dish.new(restaurant_id: nil, name: 'Dish 1', price: 50)
		dish.valid?
		expect(dish.errors[:restaurant_id]).to include("can't be blank")
	end

	it "should be invalid without a name" do
		dish = Dish.new(restaurant_id: @restaurant.id, name: nil, price: 50)
		dish.valid?
		expect(dish.errors[:name]).to include("can't be blank")
	end
	
end
