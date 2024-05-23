class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :category, null: false

      t.timestamps
    end
  end
end
