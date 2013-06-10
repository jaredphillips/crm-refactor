
require_relative 'crm_database'

class Runner
  id = 100
  db = Database.new
  puts "\e[H\e[2J"
  loop do
    
    puts "-------------------------------------------------"
    puts "Welcome to Jared's Customer Relationship Database"
    puts "-------------------------------------------------"
    puts
    puts "What would you like to do?\n\n"
    puts "- add               - Press 1"
    puts "- modify            - Press 2"
    puts "- display all       - Press 3"
    puts "- find a contact    - Press 4"
    puts "- display attribute - Press 5"
    puts "- delete            - Press 6"
    puts "- exit              - Press 7"
    puts

    print "=> " 
    input = gets.chomp.downcase
    puts

    case input

    when "1" # add
      id += 1

      print "First Name =>     "
      firstname = gets.chomp

      print "Last Name =>      "
      lastname = gets.chomp

      print "Email Address =>  "
      email = gets.chomp

      print "Notes =>          "
      notes = gets.chomp
      puts

      contact = {
        id: id,
        firstname: firstname,
        lastname: lastname,
        email: email,
        notes: notes
      }

      db.add(contact)
      

      puts "Success!"
      puts "\e[H\e[2J"

    when "2" # modify
      puts "Which person are fixing?"
      puts
      puts "You can search by..." 
      puts "...id,"
      puts "...first name,"
      puts "...last name,"
      puts "...or email address"
      puts
      print "Choose =>         " 
      search_from_user = gets.chomp
      contact = db.better_search(search_from_user)
  binding.pry
      puts contact.nicely_displayed    
      puts "Is this the person?"
      print "Y/N: "
      input = gets.chomp.downcase
      puts
      if input == "y"
        puts "Which attribute would you like to change?"
        puts "- firstname"
        puts "- lastname"
        puts "- email"
        puts "- notes"
        puts
        print "\u21FE "
        attribute = gets.chomp
        puts
        puts "What should the new #{attribute} be?"
        print "\u21FE "
        new_value = gets.chomp
        db.modify_contact(contact, attribute, new_value)
        puts
        contact.nicely_displayed
        puts
        puts "Got it!"
        puts "\e[H\e[2J"
      end

    when "3" # display all
      db.display_all_contacts

    when "4" # find a contact
      puts "Search by id, first name, last name, or email address."
      puts
      search_from_user = gets.chomp
      puts
      puts "Here you go!"
      puts
      contact = db.better_search(search_from_user)
      contact.nicely_displayed
      puts "\e[H\e[2J"

    when "5" # display all the attributes for contact
      puts "Display each contact's..."
      puts "- firstname"
      puts "- lastname"
      puts "- email"
      puts "- id"
      puts
      attribute = gets.chomp
      puts
      db.display_info_by_attribute(attribute)
      

    when "6" # delete a contact
      puts "Search by id, first name, last name, or email address."
      puts
      search_term = gets.chomp
      puts
      contact = db.better_search(search_term)
      contact.nicely_displayed
      puts "Are you sure you want to delete this contact? (y/n)"
      puts
      input = gets.chomp.downcase
      if input == "y"
        db.delete_contact(contact)
        puts "Got it!"
      end     
      puts "\e[H\e[2J"  

    when "7" # exit program
      puts "Ok, See you later."
      puts "\e[H\e[2J"
      break

    else
      puts "\e[H\e[2J"
      puts "I'm sorry. I didn't catch that..."
      next

    end
  end
end

Runner.new