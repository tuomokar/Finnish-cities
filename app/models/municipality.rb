class Municipality < ActiveRecord::Base
  translates :name, :link, :description,:fallbacks_for_empty_translations => true

  belongs_to :region
  has_many :places
  has_many :ratings, through: :places

  def top_rated
    return [] unless ratings.count != 0

    places_to_return = []

    places.each do |place|
      places_to_return << place if place.ratings.any?
    end

    places_to_return
  end
end
