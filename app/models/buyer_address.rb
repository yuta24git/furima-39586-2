class BuyerAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :user_id, :item_id,
                :price, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :price
    validates :token
  end

  def save
    buyer = Buyer.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, municipality:, address:,
                   building_name:, telephone_number:)
  end
end
