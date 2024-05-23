class List < ApplicationRecord
  belongs_to :user

  has_many :movie_lists
  has_many :movies, through: :movie_lists

  enum category: {favorite: 0, to_watch: 1}

  def humanized_category_name
    I18n.t("activerecord.attributes.list.category.#{self.category}")
  end
end
