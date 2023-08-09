class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, persence :true
  validates :explanation, persence :true
  validates :category_id, persence :true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :situation_id, persence :true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :responsibility_id, persence :true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id ,persence :true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :number_of_day_id, persence :true, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, persence :true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :responsibility
  belongs_to :prefecture
  belongs_to :number_of_day
end
