require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入画面' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '値が正常に入っている場合は購入できること' do
      expect(@order_address).to be_valid
    end

    it '郵便番号が入っていないと購入できないこと' do
      @order_address.zip = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip can't be blank")
    end

    it '郵便番号にはハイフンが入っていないと購入できないこと' do
      @order_address.zip = '4901113'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Zip is invalid. Include hyphen(-)')
    end

    it '都道府県が入っていないと購入できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が入っていないと購入できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が入っていないと購入できないこと' do
      @order_address.block = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end

    it '電話番号が入っていないと購入できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にはハイフンは不要で、11桁以内でないと購入できないこと' do
      @order_address.phone_number = '090-1223-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input half-width numbers.')
    end

    it 'tokenが空では登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
