class CreateDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :nacionalidade
      t.string :data_nascimento
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
