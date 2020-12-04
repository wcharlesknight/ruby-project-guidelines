class Perpetrator < ActiveRecord::Base
    has_many :offenses
    has_many :neighborhoods, through: :offenses

    def self.most_offenses
        offense = Offense.group("perpetrator_id").order("count(perpetrator_id) DESC").limit(10).to_a
        offense.map do |o|
            Perpetrator.where(id: o.perpetrator_id)
        end     
    end

    def self.list_of_offenses(name)
        offenses = Perpetrator.where(name: name)
        offenses.map do |o|
            Offense.where(perpetrator_id: o.id).to_a 
        end 
    end

    def self.list_of_perps
       puts Perpetrator.all.map { |x| x.name}.to_a
    end

end

