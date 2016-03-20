class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.float :area
      t.integer :population
      t.text :description

      t.timestamps null: false
    end
  end
end
