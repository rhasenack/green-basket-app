# app/controllers/registrations_controller.rb
class CustomRegistrationsController < Devise::RegistrationsController
  after_action :after_sign_up, only: :create

  def after_sign_up
    # raise
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
