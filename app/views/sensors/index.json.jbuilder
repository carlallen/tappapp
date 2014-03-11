json.array!(@sensors) do |sensor|
  json.extract! sensor, :id, :name, :type, :reading
  json.url sensor_url(sensor, format: :json)
end
