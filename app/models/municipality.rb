class Municipality < ActiveRecord::Base
  translates :name, :link, :description,:fallbacks_for_empty_translations => true
  has_one :location, as: :locationable

  belongs_to :region
  has_many :places
  has_many :ratings, through: :places

  def top_rated
    places_with_any_ratings = places.joins(:ratings)
    sorted_rated_places_in_desc_order = places_with_any_ratings.sort_by{ |p| -(p.average_rating) }
    sorted_rated_places_in_desc_order.take 3
  end
end
