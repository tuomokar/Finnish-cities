class Municipality < ActiveRecord::Base
  translates :name, :website, :description,:fallbacks_for_empty_translations => true
end
