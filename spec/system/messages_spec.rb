require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'messages', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @message = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
    # ログインする
    basic_pass root_path
    visit new_user_session_path
    fill_in 'user[email]', with: @item.user.email
    fill_in 'user[password]', with: @item.user.password
    click_on('ログイン')
    expect(current_path).to eq(root_path)

    # topic詳細ページに遷移する
    visit item_path(@item)
    # フォームに情報を入力する
    fill_in 'message[text]', with: @message
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect  do
      find('button[name="commit"]').click
    end.to change { Message.count }.by(1)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @message
  end
end
