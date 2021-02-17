class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: :show

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new # needed to instantiate the form_for
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # keeps current state in new form and shows errors
      render "new"
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :category)
  end
end

# A visitor can see the list of all restaurants.
# GET "restaurants"

# A visitor can add a new restaurant, and be redirected to the show view of that new restaurant.
# GET "restaurants/new"
# POST "restaurants"

# A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
# GET "restaurants/38"

# A visitor can add a new review to a restaurant
# GET "restaurants/38/reviews/new"
# POST "restaurants/38/reviews"
