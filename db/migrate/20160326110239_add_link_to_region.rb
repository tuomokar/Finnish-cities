class AddLinkToRegion < ActiveRecord::Migration
  def up
    Region.add_translation_fields! link: :string
  end

  def down
    remove_column :region_translations, :link
  end
end
