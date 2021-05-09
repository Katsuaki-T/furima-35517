require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)

    end
    context '内容に問題がない場合' do
      it '全ての情報があれば保存できる' do
        expect(@purchase_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      # it 'userが紐付いていないと保存できないこと' do
      #   @purchase_address(user_id: nil)
      #   @purchase_address.valid?
    
      #   expect(@purchase_address.errors.full_messages).to include('User must exist')
      # end
    end
  end
end
