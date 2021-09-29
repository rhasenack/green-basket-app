# app/controllers/custom_sessions_controller.rb
class CustomSessionsController < Devise::SessionsController

  after_action :after_login, only: :create

  def after_login
    check_user_cart
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
