class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { standard: 0, admin: 1 }
  has_one :user_profile
  has_many :lists
  after_create :set_lists

  def check_list(list, id)
    fav = self.lists.find_by(category: list)
    fav.movies.exists?(id: id)
  end
  
  private
  def set_lists
    List.create!(category: "favorite", user: self)
    List.create!(category: "to_watch", user: self)
  end
end
