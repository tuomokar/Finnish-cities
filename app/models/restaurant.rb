class Restaurant < ActiveRecord::Base
  acts_as :place

  def self.top_rated
    places_with_ratings = Place.joins(:ratings)
    restaurants_with_ratings = (places_with_ratings.where actable_type:"Restaurant").uniq
    sorted_rated_restaurants_in_desc_order = restaurants_with_ratings.sort_by{ |r| -(r.average_rating) }
    sorted_rated_restaurants_in_desc_order.take 3
  end
end
