require 'rails_helper'

RSpec.describe Activity, :type => :model do
  describe 'validation' do
    describe 'user_id' do
      context 'blank' do
        before do
          @activity = Activity.new(activity_type_id: 1)
        end

        it { expect(@activity).not_to be_valid }
      end
    end

    describe 'activity_type_id' do
      context 'blank' do
        before do
          @activity = Activity.new(user_id: 1)
        end

        it { expect(@activity).not_to be_valid }
      end
    end

    context 'valid' do
      before do
        @activity = Activity.new(user_id: 1, activity_type_id: 1)
      end

      it { expect(@activity).to be_valid }
    end
  end
end
