
require_relative "crm_contact"

class Database

  def initialize
    @contacts_array = []
  end

  def add(contact)
    @contacts_array.push Contact.new(contact)
  end

  def modify_contact(contact, attribute, new_value)

    contact.send("#{attribute}=", new_value)
    return contact
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
    # I think Array#uniq method would be a good refactor
    @contacts_array.each do |contact|
      case
      when search == contact.id
        return contact
      when search == contact.firstname
        return contact
      when search == contact.lastname
        return contact
      when search == contact.email
        return contact
      when search == contact.notes
        return contact
      end
    end
  end
end