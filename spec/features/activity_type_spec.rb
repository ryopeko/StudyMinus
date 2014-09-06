require 'rails_helper'

describe '/activity_types/new' do
  subject(:user) { create :user }

  context 'when signed in' do
    before do
      signin(user)
      visit new_activity_type_path
    end

    it { expect(page).to have_css('form#new-activity-form') }
  end

  context 'when signed out' do
  end
end
