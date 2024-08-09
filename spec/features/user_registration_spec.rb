# spec/features/user_registration_spec.rb
require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  let(:user) { FactoryBot.build(:user) }

  before do
    visit new_user_registration_path
  end

  it 'User registers successfully' do
    fill_in 'nickname', with: user.nickname  
    fill_in 'email', with: user.email  
    fill_in 'password', with: user.password
    fill_in 'password-confirmation', with: user.password_confirmation   
    fill_in 'last-name', with: user.last_name  
    fill_in 'first-name', with: user.first_name  
    fill_in 'last-name-kana', with: user.last_name_kana  
    fill_in 'first-name-kana', with: user.first_name_kana  
    select '2000', from: 'user_birth_date_1i'
    select '1', from: 'user_birth_date_2i'
    select '1', from: 'user_birth_date_3i'
    click_button '会員登録'
    expect(page).to have_content 'ログアウト'
  end

  it 'User fails to register with empty fields' do
    click_button '会員登録'
    expect(page).to have_content "can't be blank"
  end
end
