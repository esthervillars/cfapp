FactoryGirl.define do
	
		factory :user do
			email { "user#{rand()}@example.com"}
	    password "1234567890"
	    first_name "Peter"
	    last_name "Example"
	    admin false
	

		factory :admin, class: User do
		  admin true
		  first_name "Admin"
		  last_name "User"
		end
	end
end