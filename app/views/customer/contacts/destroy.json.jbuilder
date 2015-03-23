json.array! @customer_contacts do |contact|
  json.id contact.id
  json.name contact.name
  json.detail contact.detail
end
