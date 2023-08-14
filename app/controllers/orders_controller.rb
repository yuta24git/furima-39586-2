class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, buyer_id: current_user.id).merge(user_id: @item.user_id, item_id: @item.id, price: @item.price, token:params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
