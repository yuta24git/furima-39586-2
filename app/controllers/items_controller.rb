class ItemsController < ApplicationController
  before_action :move_to_new_user_session_path, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :situation_id, :responsibility_id, :prefecture_id,
                                 :number_of_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_new_user_session_path
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
