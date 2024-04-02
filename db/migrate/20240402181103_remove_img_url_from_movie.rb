class RemoveImgUrlFromMovie < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :img_url, :string
  end
end
