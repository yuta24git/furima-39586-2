class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path  
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :situation_id, :responsibility_id, :prefecture_id, :number_of_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
