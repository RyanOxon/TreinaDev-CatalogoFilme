class Gender < ApplicationRecord
    has_many :movies
    has_many :directors
end
