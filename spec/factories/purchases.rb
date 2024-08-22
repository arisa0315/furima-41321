# spec/factories/orders.rb
FactoryBot.define do
  factory :order do
    association :user
    association :item
    token { "tok_#{Faker::Alphanumeric.alpha(number: 24)}" }
  end
end
