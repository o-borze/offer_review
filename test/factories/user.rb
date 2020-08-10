FactoryBot.define do
  factory :user do
    role { User.roles.keys.sample }
  end
  
  trait :admin do
    role { "admin" }
  end
  
  trait :client do
    role { "client" }
  end
  
  trait :salesman do
    role { "salesman" }
  end
end
