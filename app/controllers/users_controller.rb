class UsersController < ApplicationController
  def delivery
    @items = Item.where(delivered_by: current_user.id) if current_user
  end

  def buy
    @items = Item.where(bought_by: current_user.id) if current_user
  end
end
