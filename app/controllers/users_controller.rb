class UsersController < ApplicationController
  def delivery
    @items = Item.where(delivered_by: current_user.id) if current_user
  end

  def buy
    @items = Item.where(bought_by: current_user.id) if current_user
  end

  def my_items
    @items = current_user.items if current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'profile'
    end
  end

  def user_params
    params.require(:item).permit(:role, :phone, :name, :lastname)
  end

end
