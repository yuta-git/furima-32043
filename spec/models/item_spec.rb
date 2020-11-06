require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品情報が正しく入力されていれば出品登録できること' do
      expect(@item).to be_valid
    end

    it '商品画像が付いていないと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が入力されていないと登録できないこと' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '商品の説明が入力されていないと登録できないこと' do
      @item.item_description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
    end

    it 'カテゴリーの情報が入力されていないと登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報が入力されていないと登録できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担についての情報が入っていないと登録できないこと' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end

    it '発送元の地域についての情報が入力されていないと登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数についての情報が入力されていないと登録できないこと' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end

    it '価格についての情報が入力されていないと登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、300円未満だと登録できないこと' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '価格の範囲が、9,999,999円より大きいと登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width numbers.')
    end
  end
end
