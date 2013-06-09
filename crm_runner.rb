
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
    puts "- add"
    puts "- modify"
    puts "- display all"
    puts "- display contact"
    puts "- display attribute"
    puts "- delete"
    puts "- exit"
    puts

    print "=> " 
    input = gets.chomp.downcase
    puts

    case input

    when "add"
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

    when "modify"
      puts "Which person are fixing?"
      puts
      puts "You can search by..." 
      puts "...id,"
      puts "...first name,"
      puts "...last name,"
      puts "...or email address"
      puts
      print "Choose =>         " 
      search_term = gets.chomp
      puts
      contact = db.better_search(search_term)
      contact.nicely_displayed
      puts
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

    when "display all"
      db.display_all_contacts

    when "display contact"
      puts "Search by id, first name, last name, or email address."
      puts
      search_from_user = gets.chomp
      puts
      puts "Here you go!"
      puts
      contact = db.better_search(search_from_user)
      contact.nicely_displayed
      puts "\e[H\e[2J"

    when "display attribute"
      puts "Display each contact's..."
      puts "- firstname"
      puts "- lastname"
      puts "- email"
      puts "- id"
      puts
      attribute = gets.chomp
      puts
      db.display_info_by_attribute(attribute)
      

    when "delete"
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

    when "exit"
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