# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recruiter do
  	    name "paramesh"
        password "orange"
        password_confirmation "orange"
        phone "8500209136"
        companyaddr "film nagar"
        companyname "Techsophy"
        sequence(:email) { |n| "text#{n}@example.com"}
    end
     factory :invalid_recruiter, parent: :recruiter do |f|
  f.name nil 
 end
end
