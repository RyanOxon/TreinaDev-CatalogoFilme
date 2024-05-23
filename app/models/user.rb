class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { standard: 0, admin: 1 }
  has_one :user_profile
  has_many :lists
  after_create :set_lists

  def check_list(list_name, id)
    list = self.lists.find_by(category: list_name)
    list.movies.exists?(id: id)
  end

  def find_list(list_name)
    list = self.lists.find_by(category: list_name)
    list
  end
  
  private
  def set_lists
    List.create!(category: "favorite", user: self)
    List.create!(category: "to_watch", user: self)
  end
end
