json.array!(@locations) do |location|
  json.extract! location, :id, :loc, :coordinates
  json.url location_url(location, format: :json)
end
