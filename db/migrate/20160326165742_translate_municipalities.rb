class TranslateMunicipalities < ActiveRecord::Migration
  def self.up
    Municipality.create_translation_table!({
                                               :name => :string,
                                               :description => :text,
                                               :link => :string
                                           }, {
                                               :migrate_data => true
                                           })
  end

  def self.down
    Municipality.drop_translation_table! :migrate_data => true
  end
end