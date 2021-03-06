require 'rails_helper'

RSpec.describe ActivitiesController, :type => :controller do
  before do
    @user = create(:user)
    @type = create(:activity_type)
  end

  describe "GET index" do

    context 'signed out' do
      before do
        test_signout
        get :index
      end

      it { expect(response).to redirect_to(signin_path) }
    end

  end

  describe "GET new" do
    context 'signed in' do
      before do
        test_signin(@user)
        get :new
      end

      it { expect(assigns(:activity)).to be_a_kind_of Activity }
    end

    context 'signed out' do
      before do
        test_signout
        get :new
      end

      it { expect(response).to redirect_to(signin_path) }
    end

  end

  describe "POST create" do
    context 'signed out' do
      before do
        test_signout
        post :create, activity: {}
      end

      it { expect(response).to redirect_to(signin_path) }
    end

  end

  describe "GET show" do
    context 'signed out' do
      before do
        test_signout
        get :show, id: 1
      end

      it { expect(response).to redirect_to(signin_path) }
    end
  end
end
