json.array!(@clients) do |client|
  json.extract! client, :ordinal, :name, :slug, :description
  json.url client_url(client, format: :json)
end