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

30.times do |contact|
  Contact.create!(name: Faker::RickAndMorty.unique.character, 
                address: Faker::Address.street_address, 
                email: Faker::Internet.email, 
                phone: "1231231234", 
                user_id: @user.id
  )
end
puts "30 contacts created" 

# 30.times do |contact|
#   Contact.create!(
#     user_id: @user.id
#     # name: Faker::StarWars.character,
#     # address:Faker::Address.street_address,
#     # email:Faker::Internet.email,
#     # phone:Faker::PhoneNumber.phone_number
#     name: "Joe", address: "123", email: "fake@test.com", phone: "1231231234"
#   )
#   puts "30 contacts created"
# end 