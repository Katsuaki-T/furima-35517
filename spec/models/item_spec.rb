require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end
context '内容に問題がない場合' do

  it '全ての商品があれば出品できる場合' do
    expect(@item).to be_valid
  end
end

context '内容に問題がある場合' do

  it '画像がないと登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it '商品名がないと登録できない' do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it '商品の説明がないと登録できない' do
    @item.description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

  it 'カテゴリーが最初の状態だと登録できない' do
    @item.category_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end

  it '商品の状態が最初の状態だと登録できない' do
    @item.status_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Status must be other than 1")
  end

  it '配送料が最初の状態だと登録できない' do
    @item.shipping_charge_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
  end

  it '都道府県が最初の状態だと登録できない' do
    @item.prefecture_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it '発送日数が最初の状態だと登録できない' do
    @item.delivery_time_id = '1'
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
  end

  it '値段がないと登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '値段が¥300~¥9,999,999の間のみ保存可能' do
    @item.price = '200'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not included in the list")
  end

  it '値段は半角数字のみ保存可能' do
    @item.price = '３００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not included in the list")
  end

end 



  end
end