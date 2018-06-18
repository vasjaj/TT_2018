class ItemsController < ApplicationController
  def index
    @items = Item.all
    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC")
    else
      @items = Item.all.order("created_at DESC")
    end
  end

  # def search
  #
  # end

  def without_delivery
    @items = Item.where(delivered_by: nil)
    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC").where(delivered_by: nil)
    else
      @items = Item.where(delivered_by: nil).order("created_at DESC")
    end
  end

  def without_buy
    @items = Item.where(bought_by: nil)
    if params[:search]
      @items = Item.search(params[:search]).order("created_at DESC").where(bought_by: nil)
      #binding.pry
    else
      @items = Item.where(bought_by: nil).order("created_at DESC")
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user if signed_in?

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def delivery
    redirect_to new_user_session_path and return unless current_user
    @item = Item.find(params[:id])
    unless @item.delivered_by
      @item.delivered_by = current_user.id if current_user
      @item.save!
    end
    redirect_to @item
  end

  def delivery_refuse
    @item = Item.find(params[:id])
    @item.delivered_by = nil if @item.delivered_by = current_user.id
    @item.save!
    redirect_to @item
  end

  def buy
    redirect_to new_user_session_path and return unless current_user
    @item = Item.find(params[:id])
    unless @item.bought_by
      @item.bought_by = current_user.id if current_user
      @item.save!
    end
    redirect_to @item
  end

  def buy_refuse
    @item = Item.find(params[:id])
    @item.bought_by = nil if @item.bought_by = current_user.id
    @item.save!
    redirect_to @item
  end
  private

  def item_params
    params.require(:item).permit(:title, :description, :image, :keyword, :price, :courier_fee, :adress_to, :adress_from)
  end
end
