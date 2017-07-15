# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    costumer_message { Faker::Lorem.sentence }
    costumer_id 1
    support_agent_response { Faker::Lorem.sentence }
    support_agent_id 1
    status false
    closed_at { Faker::Date.between(Date.today, 1.days.from_now) }

    factory :invalid_ticket do
    	costumer_message nil
    end
  end
end
