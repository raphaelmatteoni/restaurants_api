class Api::V1::RestaurantsController < Api::V1::ApiController
	before_action :set_restaurant, only: [:show, :update, :destroy]

	# GET /api/v1/restaurants
	def index
		@restaurants = Restaurant.all

		render json: @restaurants
	end

	# GET /api/v1/restaurant/1
	def show
		render json: @restaurant
	end

	# POST /api/v1/restaurants
	def create
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.save
			render json: @restaurant, status: :created
		else
			render json: @restaurant.errors, status: :unprocessable_entity
		end
	end

	# PATCH/PUT /api/v1/restaurants/1
	def update
		if @restaurant.update(restaurant_params)
			render json: @restaurant
		else
			render json: @restaurant.errors, status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/restaurants/1
	def destroy
		@restaurant.destroy
	end

	private
		def set_restaurant
			@restaurant = Restaurant.find(params[:id])
		end

		def restaurant_params
			params.require(:restaurant).permit(:name)
		end
end
