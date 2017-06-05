require 'rails_helper'

	describe Product do 

		context "when the product has comments" do
			before do
				@product = Product.create!(name: "folding bike")
				@User = User.create!(email: "tony361@gmail.com, password: "password")
				@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
				@product.comments.create!(rating: 3, user: @user, body: "OK bike!")
				@product.comments.create!(rating: 5, user: @user, body: "Great bike!")

			end

			it "returns the average rating of all comments" do

			end
			
			it"is not valid" do
    	expect(Product.new(description: "Nice bike")).not_to be_valid

		end
end
