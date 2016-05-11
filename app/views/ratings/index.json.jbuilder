json.array!(@ratings) do |rating|
  json.extract! rating, :id, :comment, :place_id, :user_id
  json.url rating_url(rating, format: :json)
end
