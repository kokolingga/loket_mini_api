json.status :ok
json.success true
json.errors []

json.data do
  json.id @get_info.id
  json.first_name @get_info.first_name
  json.last_name @get_info.last_name
  json.email @get_info.email
  json.phone @get_info.phone

  json.transactions(@get_info.transactions) do |transactions|
    json.id transactions.id
    json.amount transactions.amount
    json.ticket_name transactions.ticket.name
    json.ticket_price transactions.ticket.price
    json.ticket_event_id transactions.ticket.event_id
    json.purchase_time transactions.updated_at
  end
end