class BasketsController < ApplicationController

  def index
    @baskets = Basket.all.sort_by { |x| x.restaurant.id }
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

  def new
    @basket = Basket.new()
  end

  def create
    @basket = Basket.new(basket_params)
    @basket.restaurant = Restaurant.first
    if @basket.save
      redirect_to baskets_path
    else
      render :new
    end
  end


  private

  def basket_params
    params.require(:basket).permit(:name, :price, :description, :stock, :pickup_min, :pickup_max)
  end

end
