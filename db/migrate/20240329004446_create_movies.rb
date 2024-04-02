class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :ano_de_lancamento
      t.string :sinopse
      t.string :pais
      t.integer :duracao
      t.string :img_url
      t.references :director, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
