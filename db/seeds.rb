require 'faker'

puts "Creating 100 Posts"

user1 = User.create(email: "test@test.com", password: "123456", first_name: "Robstaa", last_name: "Sushi")

100.times do
  Post.create(date: Date.today, rationale: Faker::WorldOfWarcraft.hero, user_id: user1.id)
end
