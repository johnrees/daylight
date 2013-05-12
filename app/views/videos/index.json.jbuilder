json.array!(@videos) do |video|
  json.extract! video, :name, :slug, :vimeoid, :description
  json.url video_url(video, format: :json)
end