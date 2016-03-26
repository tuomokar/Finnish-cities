json.array!(@municipalities) do |municipality|
  json.extract! municipality, :id, :name, :year, :description, :population, :link, :region_id
  json.url municipality_url(municipality, format: :json)
end
