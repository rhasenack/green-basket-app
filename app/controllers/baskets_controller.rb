class BasketsController < ApplicationController

  def index
    @baskets = Basket.all
  end

  def show

  end

  def edit

  end
end
