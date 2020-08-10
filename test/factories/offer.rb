FactoryBot.define do
  factory :offer do
    salesman { build(:user, :salesman) }
    client { build(:user, :client) }
  end
end
