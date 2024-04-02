class AddFoiLancadoToMovie < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :foi_lancado, :boolean
  end
end
