FactoryGirl.define do

  factory :user do |f|
    f.username "zachaysan"
    f.password "hunter2"

    after(:create) {|user| create(:email, owner: user)}    

  end
  
end
