class UserProfile < ApplicationRecord
  belongs_to :user

  validates :name, :age, presence: true
end
