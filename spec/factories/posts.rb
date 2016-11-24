#factory girl
#命名用model name的複數
FactoryGirl.define do
 # 使用FactoryGirl.create(:post) 可在測試中建立一個post
  factory :post do
    date Date.today
    rationale "Some Rationale"
    user
  end

  factory :second_post, class: "Post" do 
  #使用FactoryGirl.create(:second_post) 可在測試中建立另一個post
   #  一個model要建立第二個(或更多)的factory時，就要使用到'class' , class名似乎是自訂? 不確定，待查
    date Date.yesterday
    rationale "Some more content"
    user
  end
end