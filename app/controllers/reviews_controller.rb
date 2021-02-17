class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:new, :create]

  def create
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    @review.save

    redirect_to restaurant_path(@restaurant)
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def params_review
    params.require(:review).permit(:content, :rating)
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
