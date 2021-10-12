class CartsController < ApplicationController

  def add_basket_to_cart
    # raise
    @cart = Cart.where("user_id = #{current_user.id}").first
    @basket = Basket.find(params[:basket_id])

    cart_basket = CartBasket.where("cart_id = #{@cart.id} and basket_id = #{@basket.id}")

    @restaurant = @basket.restaurant.id

    ## If the cart already has baskets from another restaurant, ask for removal
    user_cart_basket = CartBasket.where("cart_id = #{@cart.id}");

    if cart_basket.size > 0
      ## If the cart already has baskets from another restaurant, ask for removal
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

  def clear_and_add_basket_to_cart
    @cart = Cart.where("user_id = #{current_user.id}").first
    @cart_baskets = CartBasket.where("cart_id = #{@cart.id}")
    # raise
    @cart_basket_modified = @cart_baskets.reject{|cart| cart == @cart_baskets.last}
    @cart_basket_modified.each do |cart_basket|
      cart_basket.destroy!
    end
  end


  def destroy_last_basket
    @cart = Cart.where("user_id = #{current_user.id}").first
    @cart_baskets = CartBasket.where("cart_id = #{@cart.id}")
    @cart_baskets.last.destroy!
  end
end
