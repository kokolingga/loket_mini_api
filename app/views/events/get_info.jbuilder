json.status :ok
json.success true
json.errors []

json.data do
  json.id @get_info.id
  json.name @get_info.name
  json.category @get_info.category
  json.event_type @get_info.event_type
  json.capacity @get_info.capacity
  json.organizer @get_info.organizer
  json.start_date @get_info.start_date
  json.end_date @get_info.end_date
  json.start_time @get_info.start_time
  json.end_time @get_info.end_time

  json.location @get_info.location

  json.tickets(@get_info.tickets) do |ticket|
    json.id ticket.id
    json.name ticket.name
    json.amount ticket.amount
    json.price ticket.price
  end
end