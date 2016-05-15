
json.array!(@places) do |place|
  if place.specific
    json.extract! place, :specific
    json.base_path place.specific.class.name.pluralize.downcase

    if place.specific.class.name == 'Restaurant'
      json.url restaurant_url(place.specific)
    end
  end
end