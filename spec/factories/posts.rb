#factory girl
#命名用model name的複數
FactoryGirl.define do
 # 使用FactoryGirl.create(:post) 可在測試中建立一個post
  factory :post do
    date Date.today
    rationale "Some Rationale"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do 
  #使用FactoryGirl.create(:second_post) 可在測試中建立另一個post
   #明確指定class (model) 為Post
    date Date.yesterday
    rationale "Some more content"
    overtime_request 0.5
    user
  end
=begin
  factory :post_from_other_user, class: "Post" do
    date Date.yesterday
    rationale "This post shouldn't be seen"
    user { FactoryGirl.create(:non_authorized_user) } #不知為何其實這是失效的，不會存到non_authorized_user
  end
=end
end