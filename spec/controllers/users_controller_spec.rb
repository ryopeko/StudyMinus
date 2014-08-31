require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET dashboard" do
    before do
      @user = create(:user)
    end
    context 'signed in' do
      before do
        test_signin(@user)
        create(:activity) do |a|
          a.user_id = @user.id
        end

        create(:activity) do |a|
          a.user_id = 9999999
        end

        get :dashboard
      end

      it { expect(response).to be_success }
      it { expect(assigns(:activities).select{|a| a.class != Activity}).to be_empty }
      it { expect(assigns(:activities)).not_to be_empty }
      it { expect(assigns(:activities).select{|a| a.user_id != @user.id}).to be_empty }
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
