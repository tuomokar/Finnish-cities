class TranslatePlaces < ActiveRecord::Migration
  def self.up
    Place.create_translation_table!({
                                               :name => :string,
                                               :description => :text,
                                               :link => :string
                                           }, {
                                               :migrate_data => true
                                           })
  end

  def self.down
    Place.drop_translation_table! :migrate_data => true
  end
end