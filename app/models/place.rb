class Place < ActiveRecord::Base
  translates :name, :link, :description
  actable
  belongs_to :municipality
end
