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
    @baskets_on_cart = {}
    @total = 0
    if @cart.cart_baskets.size > 0
      @cart.cart_baskets.each do |cart_basket|
        @baskets_on_cart[Basket.find(cart_basket.basket_id)] = cart_basket.quantity
        @total += cart_basket.quantity.to_f * Basket.find(cart_basket.basket_id).price
      end
    end
  end

  def edit

  end


end
