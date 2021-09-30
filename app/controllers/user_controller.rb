class UserController < ApplicationController

  def dashboard
    @user = current_user
    @orders = Order.where("user_id = #{@user.id}")

    # if @orders.size > 0
    #   #get restaurant
    #   @restaurant = @orders.first.baskets.first.restaurant
    # end
  end
end
