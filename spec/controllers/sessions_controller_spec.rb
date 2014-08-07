require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  before do
    @user = create :user
  end

  describe "GET new" do
    context 'signed in' do
      before do
        test_signin(@user)

        get :new
      end

      it { expect(response).to redirect_to(dashboard_path) }
    end

    context 'signed out' do
      before do
        test_signout

        get :new
      end

      it { expect(response).to be_success }
    end
  end

  describe "GET create" do
    context 'signed in' do
      before do
        test_signin(@user)

        get :create
      end

      it { expect(response).to redirect_to(dashboard_path) }
    end

    context 'signed out' do
    end
  end

  describe "DELETE destroy" do
    context 'signed in' do
      before do
        test_signin(@user)

        delete :destroy
      end

      it { expect(response).to be_success }
    end

    context 'signed out' do
      before do
        test_signout

        delete :destroy
      end

      it { expect(response).to redirect_to(signin_path) }
    end
  end
end
