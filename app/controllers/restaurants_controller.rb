class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def new
    @restaurant = Restaurant.new
  end

  def create

  end
end
