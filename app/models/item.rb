class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, persence :true
  validates :explanation, persence :true
  validates :category_id, persence :true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :situation_id, persence :true
  validates :responsibility_id, persence :true
  validates :prefecture_id ,persence :true
  validates :number_of_day_id, persence :true
  validates :price, persence :true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
