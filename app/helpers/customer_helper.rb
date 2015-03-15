module CustomerHelper

  def display_customer_contact(contact)
    [contact.name, contact.detail].join(' : ')
  end

end
