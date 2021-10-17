class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    @restaurant.save!
    redirect_to baskets_path
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

end
