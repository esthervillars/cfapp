require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

	let(:product) { Product.create(name: 'MyString', price: 5.00)}

  describe "GET #create" do
    it "returns http success" do
      get :create, id: product.id 
      expect(response).to have_http_status(:success)
    end
  end

end
