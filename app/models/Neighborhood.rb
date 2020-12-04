class Neighborhood < ActiveRecord::Base
    has_many :offenses
    has_many :perpetrators, through: :offenses 

    def self.offenses(name)
        offenses = Neighborhood.where(name: name)
        offenses.map do |s|
            Offense.where(neighborhood_id: s.id)
        end
    end 

    def self.perpetrators(name)
        offenses = Neighborhood.where(name: name)
        offenses.map do |s|
            Offense.where(neighborhood_id: s.id).map do |x|
                Perpetrator.where(id: x.perpetrator_id)
            end
        end 
    end


end


