require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
context '内容に問題がない場合' do

  it '全ての情報があれば保存できる' do
    expect(@user).to be_valid
  end

end

context '内容に問題がある場合' do

  it 'ニックネームが空だと登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'メールアドレスが空だと登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it '@がない場合は登録できない' do
    @user.email = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end

  it 'メールアドレスが一意性であること' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'パスワードがなければ登録できない' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'パスワードは、6文字以上でないと登録できない' do
    @user.password = '1a1a1'
    @user.password_confirmation = '1a1a1'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it "passwordが存在してもencrypted_passwordがない場合は登録できないこと" do
    @user.password = '1a1a1a'
    @user.password_confirmation = '1a1a1'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it "passwordが半角英語のみは登録できないこと" do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it "全角英数混合は登録できない" do
    @user.password = 'kybjda'
    @user.password_confirmation = 'kybjda'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end

  it '誕生日がなければ登録できない' do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end

  it '名字が空だと登録できない' do
    @user.family_name  = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name is invalid")
  end

  it '名字が全角（漢字・ひらがな・カタカナ）以外は登録できない' do
    @user.family_name  = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name is invalid")
  end

  it '名前が空だと登録できない' do
    @user.first_name  = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
  end

  it '名前が全角（漢字・ひらがな・カタカナ）以外は登録できない' do
    @user.first_name  = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
  end

  it '名字（カタカナ）が空だと登録できない' do
    @user.family_name_kana  = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana is invalid")
  end

  it '名字（カタカナ）が全角（カタカナ）以外は登録できない' do
    @user.family_name_kana  = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana is invalid")
  end

  it '名前（カタカナ）が空だと登録できない' do
    @user.first_name_kana  = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
  end

  it '名字（カタカナ）が全角（カタカナ）以外は登録できない' do
    @user.first_name_kana  = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
  end
end
    

    

    

    

   

    

    


  end
end
