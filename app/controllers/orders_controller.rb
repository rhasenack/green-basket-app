class OrdersController < ApplicationController


  def create
    @user_cart = Cart.where("user_id = #{current_user}").first
    @cart_baskets = CartBasket.where("cart_id = #{@user_cart.id}")
    total_cart_price = 0
    ## Get Price
    @cart_baskets.each do |cart_basket|
      total_cart_price += cart_basket.basket.price * cart_baskets.quantity
    end

    @order = Order.new(user: current_user, price: total_cart_price, date: Time.now)

  end
end
