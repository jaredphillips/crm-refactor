
require_relative "crm_contact"

class Database

  def initialize
    @contacts_array = []
  end

  def add(contact)
    @contacts_array.push Contact.new(contact)
  end

  def modify_contact(contact, attribute, new_value)
    #this method idea I got from Alec
    contact.send("#{attribute}=", new_value)
  end

  def display_all_contacts
    @contacts_array.each do |contact|
      contact.nicely_displayed
    end
  end

  def display_info_by_attribute(attribute)
    @contacts_array.each do |contact|
      puts contact.send(attribute)
    end
  end

  def delete_contact(contact)
    contact_index = @contacts_array.index(contact)
    @contacts_array.delete_at(contact_index)
  end


  def better_search(search) 
    @contacts_array.each do |contact|
      if (contact.id == search || contact.firstname  == search || contact.lastname == search || contact.email == search)
        return contact
      end
    end
  end
end