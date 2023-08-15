class OrdersController < ApplicationController
  include ItemsHelper
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: :index
  before_action :public_key, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
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

  def move_to_root_path
    if @item.user_id == current_user.id || buyers_exists?(@item.id)
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end
end
