require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/images/1testA.png')
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it '必要なデータが全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'infoが空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300未満では登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが英字では登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price before type cast Half-width number'
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price before type cast Half-width number'
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price before type cast Half-width number'
      end
      it 'category_idが--では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category select'
      end
      it 'sales_status_idが--では登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Sales status select'
      end
      it 'shipping_fee_status_idが--では登録できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee status select'
      end
      it 'prefecture_idが---では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture select'
      end
      it 'scheduled_delivery_idが--では登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Scheduled delivery select'
      end
    end
  end
end
