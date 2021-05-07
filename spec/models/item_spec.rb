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


end 



  end
end