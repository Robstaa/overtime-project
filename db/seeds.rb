require 'faker'

puts "Creating 100 Posts"

100.times do
  Post.create(date: Date.today, rationale: Faker::WorldOfWarcraft.hero)
end
