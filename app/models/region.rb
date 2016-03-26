class Region < ActiveRecord::Base
  translates :name, :description, :fallbacks_for_empty_translations => true
end