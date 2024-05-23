require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  describe '#presence' do
    it 'of name' do
      user_profile = UserProfile.new(name: nil)

      user_profile.valid?
      result = user_profile.errors.include?(:name)

      expect(result).to be true
    end
    it 'of age' do
      user_profile = UserProfile.new(age: nil)

      user_profile.valid?
      result = user_profile.errors.include?(:age)

      expect(result).to be true
    end
  end
end
