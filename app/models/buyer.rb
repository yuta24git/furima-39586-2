class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  validates :post_codo, presence: true
  validates :prefecture_id, presence: true
  validates :municipality_id, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
end
