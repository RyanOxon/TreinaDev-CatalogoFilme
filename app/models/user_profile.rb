class UserProfile < ApplicationRecord
  has_one_attached :profile_picture
  belongs_to :user

  validates :name, :age, presence: true
end
