class Neighborhood < ActiveRecord::Base
    has_many :offenses
    has_many :perpetrators, through: :offenses 

    def offenses
        Offenses.all.map {|o| o.neighborhood_id == self.id}
    end

end

