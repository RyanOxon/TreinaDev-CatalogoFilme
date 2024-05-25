require 'rails_helper'

describe 'request for user profile' do
  context 'visitor' do
    it 'must be authenticated' do
      julia = User.create!(email: 'kanzaki@myself.com', password: 'password123')
      UserProfile.create!(name: 'Julia', age: 20, user: julia)

      get user_profile_path(julia)

      expect(response).to redirect_to new_user_session_path
    end
  end
  context 'standard user' do
    it 'and is not allowed to see profiles other than his' do
      julia = User.create!(email: 'kanzaki@myself.com', password: 'password123')
      UserProfile.create!(name: 'Julia', age: 20, user: julia)
      rafael = User.create!(email: 'rafael@myself.com', password: 'password123')
      UserProfile.create!(name: 'Rafael', age: 25, user: rafael)

      login_as rafael

      get user_profile_path(julia)

      expect(response).to redirect_to root_path
      expect(controller.flash[:notice]).to eq 'Você não pode acessar essa rota!'
    end
  end
end
