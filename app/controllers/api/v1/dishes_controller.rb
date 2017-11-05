class Api::V1::DishesController < Api::V1::ApiController
	before_action :set_dish, only: [:show, :update, :destroy]

	# GET /api/v1/dishes
	def index
		@dishes = Dish.all

		render json: @dishes
	end

	# GET /api/v1/dish/1
	def show
		render json: @dish
	end

	# POST /api/v1/dishes
	def create
		@dish = Dish.new(dish_params)

		if @dish.save
			render json: @dish, status: :created
		else
			render json: @dish.errors, status: :unprocessable_entity
		end
	end

	# PATCH/PUT /api/v1/dishes/1
	def update
		if @dishes.update(dish_params)
			render json: @dish
		else
			render json: @dish.errors, status: :unprocessable_entity
		end
	end

	# DELETE /api/v1/dishes/1
	def destroy
		@dish.destroy
	end

	private
		def set_dish
			@dish = Dish.find(params[:id])
		end

		def dish_params
			params.require(:dish).permit(:name)
		end
end
