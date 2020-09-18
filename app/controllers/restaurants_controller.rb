class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @categories = %w(chinese italian japanese french belgian)
    @restaurant = Restaurant.new
  end

  def create
    Restaurant.create(restaurant_params)
    redirect_to restaurants_path
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @avg_rating = avg_rating(@restaurant).round(2)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number, :review)
  end

  def avg_rating(restaurant)
    sum = 0
    count = 0
    restaurant.reviews.each do |review|
      sum += review.rating
      count += 1
    end
    sum.fdiv(count)
  end
end
