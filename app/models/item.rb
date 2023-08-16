class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buyer

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :situation_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :responsibility_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :number_of_day_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :responsibility
  belongs_to :prefecture
  belongs_to :number_of_day
end
