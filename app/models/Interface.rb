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
        Perpetrator.list_of_offenses(user_input)
    end

    def self.neighborhood_offenses
        puts 'What neighborhood would you like to look at?'
        user_input = STDIN.gets.chomp
        Neighborhood.offenses(user_input)
    end 


    def self.exit
        puts 'goodbye!'
    end 
end 