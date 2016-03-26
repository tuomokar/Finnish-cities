class Municipality < ActiveRecord::Base
  translates :name, :link, :description,:fallbacks_for_empty_translations => true

  belongs_to :region
end
