require_relative "crm_database"
db = Database.new
id = 1000

  # Display the crm greeting
  puts " --------------------------------------------------------"
  puts " Welcome to the Jared's Customer Relationship Manager\n"
  puts " --------------------------------------------------------"


loop do
  # Display the various options
  puts "What would you like to do?"
  puts "add"
  puts "modify"
  puts "display all"
  puts "display contact"
  puts "display attribute"
  puts "delete"
  puts "exit program\n"
  input = gets.chomp
  binding.pry
  case input
  when "add"
    # Get the various contact attributes from the user and store them to variables
    # Insert those variables in a new contact and add them to the database
    id += 1
    puts "First name:"
    firstname = gets.chomp.downcase
    puts "Last name: "
    lastname = gets.chomp.downcase
    puts "Email: "
    email = gets.chomp.downcase
    puts "Notes: "
    notes = gets.chomp.downcase
  when "modify"
    # Prompt the user to select an attribute
    # Confirm that they have selected the correct attribute
    # If 'yes', prompt them to type the new value for the attribute
    # Display that the contact was successfully updated to the user 
  when "display all"
    # Display all of the contacts in the database to the user
  when "display contact"
    # Prompt the user to select a contact by a specific contact attribute (E.g. Khurram)
    # Store the input in a variable and display the corresponding contact
  when "display attribute"
    # Prompt the user to search the database by one of the five attributes (E.g. "ID")
    # Display all of the the contacts by that attribute
  when "delete"
    # Prompt the user to select a contact by a specific contact attribute (E.g. Khurram)
    # Store the input in a variable and display a prompt to confirm "yes" or "no"
    # If 'yes', prompt them to type the new value for the attribute
    # Display that the contact was successfully deleted to the user
    # If 'no', prompt them to type the new value for the attribute
    # Display that the contact could not be found to the user
  when "exit"
    # Exit from the program
    break
  end
end