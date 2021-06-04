require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'Items', type: :system do
  before do
    @item1 = FactoryBot.create(:item)
    @item2 = FactoryBot.create(:item)
  end

  context 'item編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したitemの編集ができる' do
      # topic1を投稿したユーザーでログインする
      basic_pass root_path
      visit new_user_session_path
      fill_in 'user[email]', with: @item1.user.email
      fill_in 'user[password]', with: @item1.user.password
      click_on('ログイン')
      expect(current_path).to eq(root_path)
      # 詳細ページに遷移する
      visit item_path(@item1)
      # item1に「編集」へのボタンがあることを確認する
      expect(page).to have_content('編集')

      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(page).to have_content(@item1.category_id)

      # 投稿内容を編集する

      # 編集してもTweetモデルのカウントは変わらないことを確認する
      # 編集完了画面に遷移したことを確認する
      # 「更新が完了しました」の文字があることを確認する
      # トップページに遷移する
      # トップページには先ほど変更した内容のツイートが存在することを確認する（画像）
      # トップページには先ほど変更した内容のツイートが存在することを確認する（テキスト）
    end
  end
end
