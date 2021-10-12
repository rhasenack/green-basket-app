class OrdersController < ApplicationController


  def create
    @user_cart = Cart.where("user_id = #{current_user.id}").first
    @cart_baskets = CartBasket.where("cart_id = #{@user_cart.id}")
    total_cart_price = 0
    @basket = Basket.find(params[:basket_id])

    #Check if user already has an order for this day
    user_orders = Order.where("user_id = #{current_user.id}")
    user_orders.each do |order|
      if order.date.to_date == DateTime.now.to_date
        flash[:alert] = 'You already have an order placed for today!'
        redirect_to user_dashboard_path and return
      end
    end

    if @cart_baskets.empty?
      flash[:notice] = 'Your cart is empty!'
      redirect_to basket_path(@basket) and return
    end
    @order = Order.new(user: current_user, date: Time.now, status: 'placed')
    @order.save!

    @cart_baskets.each do |cart_basket|
      total_cart_price += cart_basket.basket.price * cart_basket.quantity
      basket = cart_basket.basket
      order_basket = OrdersBasket.new(order: @order, basket: basket, name: basket.name, description: basket.description, price: basket.price, quantity: cart_basket.quantity, )
      order_basket.save!
    end

    @order.price = total_cart_price
    @order.save!

    ## Clear cart on order creation
    @user_cart = Cart.where("user_id = #{current_user.id}").first
    CartBasket.where("cart_id = #{@user_cart.id}").each(&:destroy!)
    ## redirect to user dashboard
    redirect_to user_dashboard_path, notice: "Order created successfully!"
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy!
    redirect_to user_dashboard_path
  end
end
