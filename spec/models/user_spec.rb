require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'メールアドレスが必須であること' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = "a@a"
      expect(@user).to be_valid
    end

    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")

    end
    
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = "1a1a1"
      @user.password_confirmation = "1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = "1a1a1a"
      @user.password_confirmation = "1a1a1a"
      expect(@user).to be_valid
    end
    
  end
end





