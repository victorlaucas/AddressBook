require 'faker'

User.create!(
  email: "admin@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  roles: "admin"
  )

puts "1 Admin user created"

2.times do |user| 
  @user = User.create!(
          email: "test#{user+1}@test.com",
          password: "asdfasdf",
          password_confirmation: "asdfasdf"
  )
end 

puts "2 regular user created"

40.times do |contact|
  Contact.create!(name: Faker::RickAndMorty.unique.character, 
                address: Faker::Address.street_address, 
                email: Faker::Internet.email, 
                phone: "1231231234", 
                user_id: @user.id
  )
end
puts "40 contacts created"  