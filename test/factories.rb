FactoryGirl.define 	do
	factory :player do
		name "Chuck Norris"
		position "1"
	end

	factory :user do
		email "a@a.com"
		password 'aaaaaaaa'
	end

	factory :rank do
		position "1"
	end
end