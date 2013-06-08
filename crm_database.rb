require_relative "crm_contact"
class Database
  attr_accessor :contacts_array

  def initialize
    @contacts_array = []
  end

  def add(contact)
    @contacts_array.push contact
  end

  def modify_contact(selection, attribute, modification)
  end

  def display_all_contacts
    @contacts_array.each do |array_element|
      array_element.each do |key, value|
        puts "#{key}: #{value}"
      end
    end
  end

  def display_particular_contact(attribute)
   @contacts_array.each do |array_element|
      array_element.each do |key, value|
        if value.to_s == attribute
          puts @contacts_array
        end
      end
    end
  end

  def display_info_by_attribute(arg)
  end

  def delete_contact(attribute)
  end
end