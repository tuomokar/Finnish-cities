class Place < ActiveRecord::Base
  translates :name, :link, :description
end
