json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :name, :headline, :contact, :topic, :description
  json.url speaker_url(speaker, format: :json)
end
