class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(order_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path   
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, buyer_id: current_user.id).merge(user_id: @item.user_id, item_id: @item.id)
  end
end
