FactoryBot.define do
  factory :post do
    date Date.today
    rationale "Some rationale"
  end

  factory :second_post, class: Post do
    date Date.yesterday
    rationale "Another rationale"
  end
end
