FactoryBot.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "john.doe@test.com"
    password "123456"
    password_confirmation "123456"
  end

  factory :admin, class: AdminUser do
    first_name "Admin"
    last_name  "User"
    email "admin.user@test.com"
    password "123456"
    password_confirmation "123456"
  end
end
