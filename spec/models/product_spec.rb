require 'rails_helper'

	describe Product do 

		context "when the product has comments" do
			before do
				@product = Product.create!(name: "test product", description: "test product", image_url: "http://no-image.jpg", colour: "black", price_in_cents: "90000")
				@User = User.create!(email: "test0@test0.com", password: "joedirt")
				@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
				@product.comments.create!(rating: 3, user: @user, body: "OK bike!")
				@product.comments.create!(rating: 5, user: @user, body: "Great bike!")

			end

			it "returns the average rating of all comments" do
				expect(@product.average_rating).to eq 3
			end
			it "is not valid" do
    	expect(Product.new(description: "test validation")).not_to be_valid
    end
		end
end
