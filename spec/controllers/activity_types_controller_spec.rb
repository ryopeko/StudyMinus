require 'rails_helper'

RSpec.describe ActivityTypesController, :type => :controller do
  before do
    @user = create(:user)
  end

  describe "GET new" do
    context 'signed in ' do
      before do
        test_signin(@user)

        get :new
      end

      it { expect(response).to be_success }
      it { expect(assigns(:activity_type)).to be_kind_of ActivityType }
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
    context 'signed in ' do
      before do
        test_signin(@user)
      end

      context 'invalid params' do
        before do
          post :create, activity_type: {name: ''}
        end

        it { expect(response).not_to be_success }
        it { expect(response).to have_http_status(:bad_request) }
      end

      context 'valid params' do
        before do
          @activity_type_name = 'name'
          post :create, activity_type: {name: @activity_type_name}

          @activity_type = ActivityType.find_by(name: @activity_type_name)
        end

        it { expect(@activity_type).not_to be_nil }
        it { expect(@activity_type.name).to eq @activity_type_name }
        it { expect(response).to redirect_to(activity_type_path(id: @activity_type.id)) }
      end
    end

    context 'signed out' do
      before do
        test_signout
        post :create
      end

      it { expect(response).to redirect_to(signin_path) }
    end
  end

  describe 'GET show' do
    context 'signed in' do
      before do
        test_signin(@user)
        @activity_type = create(:activity_type)
      end

      context 'when params has a activity type id' do
        before do
          get :show, id: @activity_type.id
        end

        let(:assigned_activity_type) { assigns(:activity_type) }

        it { expect(assigned_activity_type).to be_a ActivityType }
        it { expect(assigned_activity_type.id).to eq @activity_type.id }
      end

      context 'when specify id does not exist' do
        before do
          get :show, id: 1234567

        end

        it { expect(response).to have_http_status(:not_found) }
      end
    end

    context 'signed out' do
      before do
        test_signout
      end
    end
  end
end
