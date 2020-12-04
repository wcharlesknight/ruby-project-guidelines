#require "awesome_print"

class Interface
    def self.start
        puts 'Hello'
        puts '1. search criminals'
        puts '2. search neighborhoods'
        puts '3. exit'
        user_input = STDIN.gets.chomp
        self.input(user_input)   
    end 

    def self.input(user_input)
        if user_input == "2"
            self.neighborhood_offenses
        elsif user_input == "1"
            self.perpetrator_offenses
        else
            self.exit
        end 
    end 

    def self.perpetrator_offenses
        puts 'What person would you like to look at?'
        user_input = STDIN.gets.chomp
        self.get_perps(user_input)
        #Perpetrator.list_of_offenses(user_input)
    end

    def self.get_perps(user_input)
        Perpetrator.list_of_offenses(user_input)
        puts "Hit any key to return to menu"
        user_input = STDIN.gets.chomp
        self.start
    end

    def self.get_neighborhoods(user_input)
        p Neighborhood.offenses(user_input).each { |x| x}
        puts "Hit any key to return to menu"
        user_input = STDIN.gets.chomp
        self.start
    end

    def self.neighborhood_offenses
        puts 'What neighborhood would you like to look at?'
        user_input = STDIN.gets.chomp
        self.get_neighborhoods(user_input)
    end 


    def self.exit
        puts 'goodbye!'
    end 
end 