FactoryGirl.define do
  factory :access_token do
    token "MyString"

    association :user, factory: :user
  end
end
