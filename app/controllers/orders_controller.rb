class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer = Buyer.create(buyer_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private
  def order_params
    params.permit(buyer_id: current_user.id).merge(user_id: @item.user_id)
  end
  
  def address_params
    params.permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number ).mergr(buyer_id: @buyer.id)
  end
end
