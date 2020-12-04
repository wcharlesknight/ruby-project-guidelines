class Perpetrator < ActiveRecord::Base
    has_many :offenses
    has_many :neighborhoods, through: :offenses

    def self.most_offenses
        id = Offense.group(:perpetrator_id).count.values.sort.last
        Perpetrator.where(id: id)
    end

    def self.list_of_offenses(name)
        offenses = Perpetrator.where(name: name)
        offenses.map do |o|
            Offense.where(perpetrator_id: o.id).to_a 
        end 
    end

end

