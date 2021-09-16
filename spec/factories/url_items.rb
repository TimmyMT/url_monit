FactoryBot.define do
  factory :url_item do
    url { "https://google.com" }
    active { false }
    delay { [] }
  end
end
