FactoryBot.define do
  factory :url_item do
    url { "https://google.com" }
    active { false }
    response_times { [] }
  end
end
