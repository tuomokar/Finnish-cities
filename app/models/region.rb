class Region < ActiveRecord::Base
  translates :name, :description, :link, :fallbacks_for_empty_translations => true

  has_many :municipalities
end