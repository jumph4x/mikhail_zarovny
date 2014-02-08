json.array!(@images) do |image|
  json.extract! image, :id, :title, :year, :discipline, :subject_matter, :dimensions, :keywords, :description, :upload
  json.url image_url(image, format: :json)
end
