require 'faker'

puts "Creates one Admin and one regular User"

user1 = User.create(email: "test@test.com",
                    password: "123456",
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    phone_number: "004917661387174")

admin = AdminUser.create(email: "admin@test.com",
                        password: "123456",
                        first_name: "Admin",
                        last_name: "User",
                        phone_number: "004917661387174")

puts "Creating 10 User Posts"

10.times do
  Post.create(date: Date.today, rationale: Faker::WorldOfWarcraft.hero, user_id: user1.id, overtime_request: 2.5)
end

puts "Creating 5 Admin Posts"

5.times do
  Post.create(date: Date.today, rationale: Faker::WorldOfWarcraft.hero, user_id: admin.id, overtime_request: 2.5)
end

puts "Creates 10 Audit Logs"

10.times do
  FactoryBot.create(:audit_log, user_id: user1.id)
end

