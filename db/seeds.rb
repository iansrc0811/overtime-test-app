@user = User.create(email: "test@test.com", password: 'abcedfg', 
        password_confirmation: "abcedfg" , first_name: "john", last_name: "Snow")
puts "1 user created"
100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content",
    user_id: @user.id)
end

puts "100 Posts have been created"