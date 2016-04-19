class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :actable_id
      t.string  :actable_type

      t.string :name
      t.string :link
      t.text :description
      t.integer :municipality_id

      t.timestamps null: false
    end
  end
end
