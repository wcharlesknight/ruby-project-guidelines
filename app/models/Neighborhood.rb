class Neighborhood < ActiveRecord::Base
    has_many :offenses
    has_many :perpetrators, through: :offenses 

    # def self.all
    #     GetPrograms.neighborhoods.uniq
    # end

    # def num_offenses
    #     GetPrograms.all.select {|x| x["mcpp"] == self}.count
    # end

    # def self.most_offenses
    #     GetPrograms.all.select {|x| x["mcpp"] }
    # end
end

# "GREENWOOD" = Neighborhood.new 