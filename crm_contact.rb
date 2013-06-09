
class Contact
  attr_accessor :id, :firstname, :lastname, :email, :notes

  def initialize(arguments)
    @id        = arguments[:id]
    @firstname = arguments[:firstname]
    @lastname  = arguments[:lastname]
    @email     = arguments[:email]
    @notes     = arguments[:notes]
  end

  def nicely_displayed
    puts 
    puts "Contact: \n"
    puts "ID #:  #{@id}"
    puts "Name:  #{@firstname} #{@lastname}"
    puts "Email: #{@email}"
    puts "Notes: #{@notes}" 
  end
end