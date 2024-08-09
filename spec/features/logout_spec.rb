# spec/features/logout_spec.rb
require 'rails_helper'

RSpec.describe 'ログアウト機能', type: :feature do
  let!(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email  
    fill_in 'user_password', with: user.password  
    click_button 'ログイン'
  end

  it 'ログアウトが正常に行える' do
    click_link 'ログアウト'
    expect(page).to have_content 'ログイン'
  end
end
