class Place < ActiveRecord::Base
  translates :name, :link, :description
  actable

  belongs_to :municipality
  has_many :ratings

  alias_attribute :type, :actable_type
end
