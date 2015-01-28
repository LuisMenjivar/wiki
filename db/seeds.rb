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
  Wiky.create!(
    user: users.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph,
    created_at: rand(2.hours .. 1.year).ago
  )
end
wikys = Wiky.all

# Create an admin user
admin = User.new(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!

# Create an premium user
premium = User.new(
  email:    'premium@example.com',
  password: 'helloworld',
  role:     'premium'
)
premium.skip_confirmation!
premium.save!

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