class Region < ActiveRecord::Base
  translates :name, :description, :link, :fallbacks_for_empty_translations => true
end