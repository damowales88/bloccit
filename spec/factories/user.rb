FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end

  factory :user_with_post_and_comment do
    after(:build) { |post| create(:post) }
    after(:build) { |comment| create(:comment) }
  end
end

