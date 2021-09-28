class CartsController < ApplicationController
  before_action :check_user_cart, only: [:add_basket_to_cart]

  def add_basket_to_cart
    # raise
    @cart = Cart.where("user_id = #{current_user.id}").first
    @basket = Basket.find(params[:basket_id])

    cart_basket = CartBasket.where("cart_id = #{@cart.id} and basket_id = #{@basket.id}")

    if cart_basket.size > 0
      cart_basket.first.quantity.nil? ? cart_basket.first.quantity = 1 : cart_basket.first.quantity += 1
      cart_basket.first.save!
    else
      cart_basket = CartBasket.new(cart: @cart, basket: @basket, quantity: 1)
      cart_basket.save!
    end
  end

  def remove_basket_from_cart
    @cart = Cart.where("user_id = #{current_user.id}").first
    @basket = Basket.find(params[:basket_id])
    cart_basket = CartBasket.where("cart_id = #{@cart.id} and basket_id = #{@basket.id}")

    if cart_basket.size > 0 && cart_basket.first.quantity > 1
      cart_basket.first.quantity -= 1
      cart_basket.first.save!
    elsif cart_basket.size > 0  && cart_basket.first.quantity == 1
      cart_basket.first.destroy!
    end
  end

  private

  def check_user_cart
    user_cart = Cart.where("user_id = #{current_user.id}")

    if user_cart.size == 0
      cart = Cart.new()
      cart.user = current_user
      cart.save!
    end
  end

end
