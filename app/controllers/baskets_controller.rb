class BasketsController < ApplicationController

  def index
    @baskets = Basket.all
  end

  def show
    # raise
    @basket = Basket.find(params[:id])
    @restaurant = @basket.restaurant
    @baskets = Basket.where("restaurant_id = #{@restaurant.id} and id != #{@basket.id}")
    @cart = Cart.where("user_id = #{current_user.id}").first
  end

  def edit

  end


end
