class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new
      user.establishment?
    end
  end
end
