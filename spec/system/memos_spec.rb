require 'rails_helper'

describe 'メモ機能', type: :system do
  describe '一覧表示機能' do

    #ユーザーAを作成しておく
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    #ユーザーBを作成しておく
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    
    before do  
      #作成者がユーザーAのメモを作成しておく
      FactoryBot.create(:memo, title: '最初のメモ', user: user_a)
      #ユーザーAがログインする
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログイン'
      #メモ一覧ページに移動する
      click_link 'Memo'

    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }
      it 'ユーザーAが作成したメモが表示される' do
        #作成済みのメモが画面上に表示されていることを確認
        expect(page).to have_content '最初のメモ'
      end
    end

    context 'ユーザーBがログインしているとき' do
      let(:login_user) { user_b }
      it 'ユーザーAが作成したメモが表示されない' do
        #作成済みのメモが画面上に表示されていないことを確認
        expect(page).to have_no_content '最初のメモ'
      end
    end

  end
end
