class List < ApplicationRecord
  belongs_to :user

  has_many :movie_lists
  has_many :movies, through: :movie_lists

  enum category: {favorite: 0, to_watch: 1}
end
