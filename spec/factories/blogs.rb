FactoryBot.define do
  factory :blog do
    description { 'ブログを書く' }
    user
  end
end