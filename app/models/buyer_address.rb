class BuyerAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'が登録できません。郵便番号は‐（ハイフン）を含めてください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'が登録できません' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buyer = Buyer.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, municipality:, address:,
                   building_name:, telephone_number:, buyer_id: buyer.id)
  end
end
