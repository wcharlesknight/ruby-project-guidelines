class Perpetrator < ActiveRecord::Base
    has_many :offenses
    has_many :neighborhoods, through: :offenses

    def self.most_offenses
        Offense.group('perpetrator_id').order('count_all').limit(1).count
    end

    def self.list_of_offenses(name)
        offenses = Perpetrator.where(name: name)
        offenses.map do |o|
            Offense.where(perpetrator_id: o.id)
        end 
    end

end

