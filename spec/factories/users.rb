#factory girl
#命名用model name的複數
FactoryGirl.define do
  #製造不同的email 不然會錯誤
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'Jon'
    last_name 'Snow'
    email { generate :email } #由sequence產生
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :admin_user, class: "AdminUser" do 
  #  一個model要建立第二個(或更多)的factory時，就要使用到'class' , class名似乎是自訂? 不確定，待查
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end