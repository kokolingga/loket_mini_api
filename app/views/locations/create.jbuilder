json.status :ok
json.success true
json.errors []

json.data do
  json.id @location.id
  json.name @location.name
  json.address @location.address
  json.city @location.city
  json.google_map_url @location.google_map_url
  json.created_at @location.created_at
  json.updated_at @location.updated_at
end