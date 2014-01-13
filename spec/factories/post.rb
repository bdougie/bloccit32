FactoryGirl.define do 
	factory :post do
		title "First Post"
		body "This is the newest post. It needs 20 char to be saved."
		user
		topic
	end	
end

FactoryGirl.define do 
	factory :topic do
		name "Test Topic"
	end
end

FactoryGirl.define do 
	factory :user do
		name "Douglas Adams"
		email "douglas@example.com"
		password "helloworld"
		password_confirmation "helloworld"
		confirmed_at Time.now
	end
end

