class OrdersController < ApplicationController
  include ItemsHelper
  before_action :set_item, only: [:index, :create]
  before_action :move_to_page, only: :index

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    set_item
    @buyer_address = BuyerAddress.new
  end

  def create
    set_item
    @buyer_address = BuyerAddress.new(order_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name,
                                          :telephone_number).merge(user_id: @item.user_id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_page
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif @item.user_id == current_user.id || buyers_exists?(@item.id)
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
