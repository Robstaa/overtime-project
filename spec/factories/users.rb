FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user, class: "User" do
    first_name "John"
    last_name  "Doe"
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    phone_number "12345678"
  end

  factory :admin, class: "AdminUser" do
    first_name "Admin"
    last_name  "User"
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    phone_number "12345678"
  end

  factory :non_authorized_user, class: "User" do
    first_name "Un"
    last_name "User"
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    phone_number "12345678"
  end
end
