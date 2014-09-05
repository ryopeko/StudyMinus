require 'rails_helper'

def signin(user)
  visit signin_path

  find('a#twitter-oauth').click
end

def signout
  page.reset!
end


describe '/signin' do
  subject(:user) { create :user }

  context 'when signed in' do
    before do
      signin(user)
    end

    it {
      expect(current_path).to eq dashboard_path
    }

    it {
      expect(page).to have_css('a#signout')
    }
  end

  context 'when signed out' do
    before do
      signout
      visit signin_path
    end

    it {
      expect(page).to have_css('a#twitter-oauth')
    }

    it {
      expect(page).not_to have_css('a#signout')
    }
  end
end
