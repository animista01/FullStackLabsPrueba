# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email { Faker::Internet.email }
  	password 'secret'
	password_confirmation 'secret'	
	admin false
  role_id 1
	
	factory :invalid_user do
    	email nil
    end

  	factory :admin do
		admin true
	end
  end
end
