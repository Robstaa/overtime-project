FactoryBot.define do
  factory :post, class: "Post" do
    date Date.today
    rationale "Some rationale"
    overtime_request 2
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Another rationale"
    overtime_request 3
    user
  end

  factory :scope_post, class: "Post" do
    date Date.today
    rationale "You should see this post, if you are the owner"
    overtime_request 0.5
    user
  end
end
