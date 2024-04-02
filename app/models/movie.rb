class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :gender
  has_one_attached :picture
end
