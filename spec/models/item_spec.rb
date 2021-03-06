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
        expect(@item.errors.full_messages).to include('出品画像を入力してください')
      end

      it '商品名がないと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品の説明がないと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end

      it 'カテゴリーが最初の状態だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it '商品の状態が最初の状態だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it '配送料が最初の状態だと登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it '都道府県が最初の状態だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it '発送日数が最初の状態だと登録できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it '値段がないと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end

      it '値段が¥300~¥9,999,999の間のみ保存可能' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('価格の値を確認してください')
      end

      it '値段は半角数字のみ保存可能' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格の値を確認してください')
      end

      it '値段は10,000,000以上では登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格の値を確認してください')
      end

      it '値段は半角英数混合では登録できないこと' do
        @item.price = '3oo'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格の値を確認してください')
      end

      it '値段は半角英語だけでは登録できないこと' do
        @item.price = 'ooo'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格の値を確認してください')
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
