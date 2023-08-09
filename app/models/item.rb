class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

validates :title, persence :true
validates :explanation, persence :true
validates :category_id, persence :true
validates :situation_id, persence :true
validates :responsibility_id, persence :true
validates :prefecture_id ,persence :true
validates :number_of_day_id, persence :true
validates :price, persence :true
end
