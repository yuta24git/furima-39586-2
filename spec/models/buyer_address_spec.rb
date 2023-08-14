require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it '指示通りに入力すれば購入できる' do
        expect(@buyer_address).to be_valid
      end
      it 'buuilding_nameは空でも購入できる' do
        @buyer_address.building_name = ""
        expect(@buyer_address).to be_valid
      end
    end

    context '購入できない場合' do
      it '郵便番号が空では購入できない' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」でないと購入できない' do
        @buyer_address.post_code = '1112222'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号は半角文字列のみでないと購入できない' do
        @buyer_address.post_code = '１２３-４５６７'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが1だと購入できない' do
        @buyer_address.prefecture_id = '1'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @buyer_address.municipality = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'municipalityが空では購入できない' do
        @buyer_address.municipality = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @buyer_address.telephone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberは10桁以上11桁以内でなければ購入できない' do
        @buyer_address.telephone_number = '090123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberは半角数値でなければ購入できない' do
        @buyer_address.telephone_number = '０９０１２３４５６７８'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number is invalid")
      end
    end
  end
end
