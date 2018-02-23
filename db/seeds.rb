require 'faker'

puts "Creates one Admin and one regular User"

user1 = User.create(email: "test@test.com",
                    password: "123456",
                    first_name: "Robstaa",
                    last_name: "Sushi",
                    phone_number: "004917661387174")

admin = AdminUser.create(email: "admin@test.com",
                        password: "123456",
                        first_name: "Admin",
                        last_name: "User",
                        phone_number: "004917661387174")

puts "Creating 100 User Posts"

100.times do
  Post.create(date: Date.today, rationale: Faker::WorldOfWarcraft.hero, user_id: user1.id, overtime_request: 2.5)
end

puts "Creating 10 Admin Posts"

50.times do
  Post.create(date: Date.today, rationale: Faker::WorldOfWarcraft.hero, user_id: admin.id, overtime_request: 2.5)
end

puts "Creates 10 Audit Logs"

50.times do
  FactoryBot.create(:audit_log, user_id: user1.id)
end

