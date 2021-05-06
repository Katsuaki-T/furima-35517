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

end 



  end
end