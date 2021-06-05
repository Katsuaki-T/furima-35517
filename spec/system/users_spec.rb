require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'Users新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @address = FactoryBot.build(:address)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      basic_pass root_path

      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation

      fill_in 'user[family_name]', with: @user.family_name
      fill_in 'user[first_name]', with: @user.first_name
      fill_in 'user[family_name_kana]', with: @user.family_name_kana
      fill_in 'user[first_name_kana]', with: @user.first_name_kana

      select 1930, from: 'user[birthday(1i)]'
      select 1, from: 'user[birthday(2i)]'
      select 1, from: 'user[birthday(3i)]'
      # 次のページへ遷移したことを確認する
      click_on('Next')
      # address情報を入力する
      fill_in 'address[address]', with: @address.address
      # Sign upを押すとユーザーモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Address.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq addresses_path
      # トップページに移動する
      visit root_path
      # トップページにユーザーの名前が表示されることを確認する
      expect(page).to have_content(@user.nickname)
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずにトップページに戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページに遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # 誤ったユーザー情報を入力する
      fill_in 'user[email]', with: 'test'
      # サインアップボタンを押してもユーザーモデルのカウントが上がらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)
      # 新規登録ページへ戻ってくることを確認する
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページに遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページに遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページに遷移する
      visit root_path
      # トップページにユーザーの名前が表示されることを確認する
      expect(page).to have_content(@user.nickname)
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページに遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページに遷移する
      visit new_user_session_path
      # 誤ったユーザー情報を入力する
      fill_in 'user[email]', with: 'test'
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
