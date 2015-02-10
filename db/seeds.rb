require 'faker'


5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all
 
# Create Wikys
50.times do
  wiky = Wiky.new(
    title:  Faker::Company.bs,
    body:   Faker::Hacker.say_something_smart,
    created_at: rand(2.hours .. 1.year).ago
  )
  wiky.collaborations.build(user: users.sample)
  wiky.save
end
wikys = Wiky.all
collaborations = Collaboration.all

# Create an admin user
admin = User.new(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!
admin.update(role: "admin")

# Create an premium user
premium = User.new(
  email:    'premium@example.com',
  password: 'helloworld',
  role:     'premium'
)
premium.skip_confirmation!
premium.save!
premium.update(role: "premium")

# Create an standard user
standard = User.new(
  email:    'standard@example.com',
  password: 'helloworld',
  role:     'standard'
)
standard.skip_confirmation!
standard.save!

 
puts "DATABASE HAS BEEN SEEDED!!"
puts "#{users.count} Users were created"
puts "#{wikys.count} Wikys were created"
puts "#{collaborations.count} Collaborations were created" 