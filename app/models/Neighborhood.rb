require 'awesome_print'

class Neighborhood < ActiveRecord::Base
    has_many :offenses
    has_many :perpetrators, through: :offenses 

    def self.offenses(name)
        name.upcase!
        Offense.where(neighborhood_name: name)
    end 

    def self.perpetrators(name)
        Offense.where(neighborhood_name: name).map do |x| #list of offenses of the neighborhood I passed in above
            Perpetrator.where(id: x.perpetrator_id) #list of perpetrators that have the same id as the perpetrator_id from the list of offenses
        end 
    end

    def self.most_offenses
        offense = Offense.group("neighborhood_name").order(Arel.sql("count(neighborhood_name) DESC")).limit(10)
        offense.each_with_index.map { |x, index| ap "#{index + 1}. #{x.neighborhood_name} had #{self.offenses(x.neighborhood_name).count} crimes" }
    end

    def self.least_offenses
        offense = Offense.group("neighborhood_name").order(Arel.sql("count(neighborhood_name) ASC")).limit(10)
        offense.each_with_index.map {|x, index| ap "#{index + 1}. #{x.neighborhood_name} had #{self.offenses(x.neighborhood_name).count} crime(s)" }
    end

end


