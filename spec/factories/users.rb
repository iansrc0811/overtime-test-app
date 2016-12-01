#factory girl
#命名用model name的複數
FactoryGirl.define do
  #製造不同的email 不然會錯誤
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do  #沒有指定class,FactoryGril會用'猜'的，在此例會猜是User
    first_name 'Jon'
    last_name 'Snow'
    email { generate :email } #由sequence產生
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :admin_user, class: "AdminUser" do 
  #明確指定class (model) 為AdminUser 
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :non_authorized_user, class: "User" do 
    first_name 'non'
    last_name 'Authorized'
    email { generate :email }
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end