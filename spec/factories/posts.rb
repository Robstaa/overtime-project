FactoryBot.define do
  factory :post, class: "Post" do
    date Date.today
    rationale "Some rationale"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Another rationale"
    user
  end

  factory :scope_post, class: "Post" do
    date Date.today
    rationale "You should see this post, if you are the owner"
    user
  end
end
