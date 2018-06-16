class UsersController < ApplicationController
  def delivery
    @items = Item.where(delivered_by: current_user.id) if current_user
  end
end
