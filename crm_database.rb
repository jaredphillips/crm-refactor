require_relative "crm_contact"
class Database
  attr_accessor :contacts_array

  def initialize
    @contacts_array = []
  end

  def add(contact)
    @contacts_array.push contact
  end

  def modify_contact(selection, attribute, new_value)
    # contact.send("#{attribute}=", new_value)
  end

  def display_all_contacts
    @contacts_array.each do |contact|
       Contact.new(contact).nicely_displayed
    end
  end

  def display_particular_contact(search)
   @contacts_array.each do |contact|
      contact.each do |label, attribute|
        if attribute == search
          contact.display_contact
        end
      end
    end
  end

  def display_info_by_attribute(arg)
  end

  def delete_contact(attribute)
  end
end