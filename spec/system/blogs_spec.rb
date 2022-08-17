require 'rails_helper'

describe 'ブログ機能', type: :system do
  describe '一覧表示機能' do

    #ユーザーAを作成しておく
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    #ユーザーBを作成しておく
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    
    before do  
      #作成者がユーザーAのブログを作成しておく
      FactoryBot.create(:blog, description: '最初のブログ', user: user_a)
      #ユーザーAがログインする
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログイン'
      #ブログ一覧ページに移動する
      click_link 'Blog'

    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }
      it 'ユーザーAが作成したブログが表示される' do
        #作成済みのブログが画面上に表示されていることを確認
        expect(page).to have_content '最初のブログ'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }
      it 'ユーザーAが作成したブログが表示されている' do
        #作成済みのブログが画面上に表示されていることを確認
        expect(page).to have_content '最初のブログ'
      end
    end

  end

  # describe 'いいね機能' do
  #   #ユーザーAを作成しておく
  #   let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  #   #ユーザーBを作成しておく
  #   let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    
  #   before do  
  #     #作成者がユーザーAのブログを作成しておく
  #     FactoryBot.create(:blog, description: '最初のブログ', user: user_a)
  #     #ユーザーAがログインする
  #     visit login_path
  #     fill_in 'メールアドレス', with: login_user.email
  #     fill_in 'パスワード', with: login_user.password
  #     click_button 'ログイン'
  #     #ブログ一覧ページに移動する
  #     click_link 'Blog'
  #     #ブログ一覧ページの１つ目のブログにいいねを押す
  #     # page.all(".nolike-btn")[1].click
  #   end
  # end
end
