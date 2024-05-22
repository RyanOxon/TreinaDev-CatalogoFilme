require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#autoassign' do
    it 'role' do
      user = User.create!(email: 'kanzaki@myself.com', password: 'password123')

      expect(user.role).to eq 'standard'
    end
  end
end
