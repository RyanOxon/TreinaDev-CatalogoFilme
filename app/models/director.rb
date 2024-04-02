class Director < ApplicationRecord
  belongs_to :gender
  has_many :movies
end
