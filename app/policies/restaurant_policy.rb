class RestaurantPolicy < ApplicationPolicy
  def resolve
    scope.all
  end

  def new?
    user.establishment?
  end

  def create?
    true
  end
end
