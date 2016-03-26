class Municipality < ActiveRecord::Base
  translates :name, :link, :description,:fallbacks_for_empty_translations => true
end
