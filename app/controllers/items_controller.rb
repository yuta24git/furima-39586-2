class ItemsController < ApplicationController
  before_action :move_to_new_user_session_path, only: :new
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_root_path, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
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

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_root_path
    return if user_signed_in? && current_user.id == @item.user_id

    redirect_to root_path
  end
end
