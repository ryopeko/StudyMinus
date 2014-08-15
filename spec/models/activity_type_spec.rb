require 'rails_helper'

RSpec.describe ActivityType, :type => :model do
  describe 'validation' do
    describe 'name' do
      context 'valid' do
        let(:activity_type) { ActivityType.new(name: 'name') }

        it { expect(activity_type).to be_valid }
      end

      describe 'invalid' do
        context 'when name is empy' do
          let(:activity_type) { ActivityType.new(name: nil) }

          it { expect(activity_type).not_to be_valid }
        end
      end
    end
  end
end
