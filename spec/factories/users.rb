

 FactoryGirl.define do
 factory :user do
    name "paramesh"
     
      password "orange"
      password_confirmation "orange"
      phone "8500209136"
      address "film nagar"
      state "telangana"
      dist "rangareddy"
      citytown "hyderabad"
      mandal "jubilee hills"
      birth "10/04/1998"
 sequence(:email) { |n| "text#{n}@example.com"}
 end

 factory :invalid_user, parent: :user do |f|
  f.name nil 
 end
 end
