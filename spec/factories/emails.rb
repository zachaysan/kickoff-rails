FactoryGirl.define do

  factory :email do |f|
    f.address "zach@example.com"
    
    association :owner, factory: :user
  end

end
