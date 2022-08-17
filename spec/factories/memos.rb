FactoryBot.define do
  factory :memo do
    title { 'メモを書く' }
    description { 'テストを書く' }
    user
  end
end