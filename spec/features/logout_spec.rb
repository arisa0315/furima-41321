require 'rails_helper'

RSpec.describe 'ログアウト機能', type: :feature do
  let!(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    # フィールド名を正確に指定する
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  it 'ログアウトが正常に行える' do
    click_link 'ログアウト'
    expect(page).to have_content 'ログイン'
  end
end
