#json.extract! municipality, :id, :name, :year, :description, :population, :link, :region_id

json.array!(@municipality.places) do |place|
  if place.specific
    json.extract! place, :specific
    json.base_path place.specific.class.name.pluralize.downcase
  end
end
