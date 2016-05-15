
json.array!(@places) do |place|
  if place.specific
    json.extract! place, :specific
    json.base_path place.specific.class.name.pluralize.downcase

    if place.actable_type == 'Restaurant'
      json.url restaurant_url(place.specific)
    elsif place.actable_type == 'Brewery'
      json.url brewery_path(place.specific)
    end
  end
end