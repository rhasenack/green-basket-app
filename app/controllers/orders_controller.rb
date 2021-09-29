class OrdersController < ApplicationController


  def create
    @user_cart = Cart.where("user_id = #{current_user.id}").first
    @cart_baskets = CartBasket.where("cart_id = #{@user_cart.id}")
    total_cart_price = 0
    ## Get Price

    @order = Order.new(user: current_user, date: Time.now)
    @order.save!

    @cart_baskets.each do |cart_basket|
      total_cart_price += cart_basket.basket.price * cart_basket.quantity
      basket = cart_basket.basket
      order_basket = OrdersBasket.new(order: @order, basket: basket, name: basket.name, description: basket.description, price: basket.price, quantity: cart_basket.quantity)
      order_basket.save!
    end

    @order.price = total_cart_price
    @order.save!

  end
end
