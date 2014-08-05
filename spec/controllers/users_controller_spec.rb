require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET dashboard" do
    before do
      @user = create(:user)
    end
    context 'signed in' do
      before do
        test_signin(@user)

        get :dashboard
      end

      it { expect(response).to be_success }
    end

    context 'signed out' do
      before do
        test_signout

        get :dashboard
      end

      it { expect(response).to redirect_to(signin_path) }
    end
  end
end
