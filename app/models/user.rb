class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { standard: 0, admin: 1 }
  has_one :user_profile
  has_many :lists
  after_create :set_lists

  def check_favorite(id)
    fav = self.lists.find_by(category: "Favorite")
    fav.movies.exists?(id: id)
  end
  
  private
  def set_lists
    List.create!(category: "Favorite", user: self)
  end
end
