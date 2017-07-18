require 'rails_helper'

	describe Product do 
		let(:user) { FactoryGirl.create(:user) }
		let(:product) do
				@product = Product.create!(name: "Folding bike",
																	 description: "bike product", 
																	 image_url: "http://no-image.jpg", 
																	 colour: "black", 
																	 price: "90000")
				product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
				product.comments.create!(rating: 3, user: @user, body: "OK bike!")
				product.comments.create!(rating: 5, user: @user, body: "Great bike!")
				product
			end
		context "when the product has comments" do
			it "returns the average rating of all comments" do
				expect(@product.average_rating).to eq 3
			end

			it "is not valid" do
    	expect(Product.new(description: "test validation")).not_to be_valid
    end
	end
end
