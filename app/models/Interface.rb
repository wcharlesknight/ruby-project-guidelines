require "awesome_print"

class Interface
    def self.start
        puts " "
        puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Hello, welcome to the Seattle criminal database ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts  " "
        puts "                          type 'list' for list of criminals                                            "
        puts "                          type 'c' to search criminals                                               "  
        puts '                          type "n" to search neighborhoods'
        puts '                          type "most wanted" to see top criminal                                        '
        puts '                          type "community" to see the neighborhood with the most crimes                '
        puts '                          type "exit" to exit                                                            '
        user_input = STDIN.gets.chomp
        self.input(user_input)   
    end 

    def self.input(user_input)
        if user_input == "n"
            self.neighborhood_offenses
        elsif user_input == "c"
            self.perpetrator_offenses
        elsif user_input == "list"
            self.list
        elsif user_input == "most wanted"
            self.most_wanted
        elsif user_input == "community"            
            self.worst_neighborhood
        else
            self.exit
        end 
    end 

    def self.list
        ap Perpetrator.list_of_perps
        puts " "
        self.start
    end

    def self.most_wanted
        puts             "                    #{Perpetrator.most_offenses}                          " 
        puts " "
        self.start
    end

    def self.worst_neighborhood
        p Neighborhood.most_offenses
        puts " "
        self.start
    end

    def self.perpetrator_offenses
        puts '                                 What person would you like to look at?                                             '
        user_input = STDIN.gets.chomp
        self.get_perps(user_input)
        #Perpetrator.list_of_offenses(user_input)
    end

    def self.get_perps(user_input)
        ap Perpetrator.list_of_offenses(user_input).each { |x| x}
        puts "                                 Hit any key to return to menu                                                                 "
        user_input = STDIN.gets.chomp
        self.start
    end

    def self.get_neighborhoods(user_input)
        ap Neighborhood.offenses(user_input).each { |x| x}
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