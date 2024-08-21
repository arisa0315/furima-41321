# spec/factories/purchases.rb
FactoryBot.define do
  factory :purchase do
    association :user
    association :item
    token { "tok_#{Faker::Alphanumeric.alpha(number: 24)}" }
  end
end
