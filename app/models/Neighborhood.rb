class Neighborhood < ActiveRecord::Base
    has_many :offenses
    has_many :perpetrators, through: :offenses 

    def self.offenses(name)
        name.upcase!
        Offense.where(neighborhood_name: name)
    end 

    def self.perpetrators(name)
        Offense.where(neighborhood_name: name).map do |x|
            Perpetrator.where(id: x.perpetrator_id)
        end 
    end

    def self.most_offenses(limit)
        offense = Offense.group("neighborhood_name").order("count(neighborhood_name) DESC").limit(limit).to_a
        offense.map { |x| puts x.neighborhood_name }
    end

end


