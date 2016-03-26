class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :name
      t.integer :year
      t.text :description
      t.integer :population
      t.string :link
      t.integer :region_id

      t.timestamps null: false
    end
  end
end
