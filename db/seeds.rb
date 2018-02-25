require 'faker'

puts "Creates one Admin and one regular User"

user1 = Employee.create!(email: "test@test.com",
                    password: "123456",
                    first_name: "wuba",
                    last_name: "duba",
                    phone_number: "004917661387174")

admin = AdminUser.create!(email: "admin@test.com",
                        password: "123456",
                        first_name: "Admin",
                        last_name: "User",
                        phone_number: "004917661387174")

puts "Creates 3 Audit Logs"

AuditLog.create!(start_date: Date.today - 6.days, status: "pending", user_id: user1.id)
AuditLog.create!(start_date: Date.today - 13.days, status: "pending", user_id: user1.id)
AuditLog.create!(start_date: Date.today - 20.days, status: "pending", user_id: user1.id)

puts "Creating 10 User Posts"

10.times do
  Post.create(date: Date.today, rationale: Faker::WorldOfWarcraft.hero, user_id: user1.id, overtime_request: 2.5)
end

puts "Creating 5 Admin Posts"

5.times do
  Post.create(date: Date.today, rationale: Faker::WorldOfWarcraft.hero, user_id: admin.id, overtime_request: 2.5)
end




