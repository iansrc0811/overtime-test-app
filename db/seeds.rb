@user = User.create(email: "test@test.com", password: 'abcedfg', 
        password_confirmation: "abcedfg" , first_name: "john", last_name: "Snow")
puts "1 user created"

AdminUser.create(email: "admin@test.com", password: 'asdfasdf', 
        password_confirmation: "asdfasdf" , first_name: "admin", last_name: "user")
puts "1 AdminUser created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content",
    user_id: @user.id)
end

puts "100 Posts have been created"