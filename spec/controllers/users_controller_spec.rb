require 'rails_helper'

describe UsersController, type: :controller do

  # use let in specs
  # see http://www.betterspecs.org/
  let(:user) {FactoryGirl.create(:user)}
  let(:another_user) {FactoryGirl.create(:user)} #here you can user the same :user because the email is random now.

  describe 'GET #show' do
     context 'when a user is logged in' do
     	before do
     		sign_in user
     end
     	it "load correct user details" do
     		get:show, user.id
     		expect(response).to have_http_status(200)
     		expect(assigns(:user)).to eq user
     	end

      it "cannot access to other user" do
        get:show, another_user.id
        expect(response).to redirect_to(root_path)
      end
    end
      

     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, user.id
         expect(response).to redirect_to(new_user_session_path)
       end
     end
  end

end

