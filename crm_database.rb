require_relative "crm_contact"
class Database
  attr_accessor :contacts_array

  def initialize
    @contacts_array = Array.new
  end

  def add(contact)
  end

  def modify_contact(selection, attribute, modification)
  end

  def display_all_contacts
  end

  def display_particular_contact(attribute)
  end

  def display_info_by_attribute(arg)
  end

  def delete_contact(attribute)
  end
end