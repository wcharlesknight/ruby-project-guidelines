require "awesome_print"

class Perpetrator < ActiveRecord::Base
    has_many :offenses
    has_many :neighborhoods, through: :offenses


    def self.p_name(id)
        name = Perpetrator.where(id: id).map { |x| x.name }
        name
    end

    def self.list_of_offenses(name)
        Perpetrator.where(name: name).first.offenses.map { |x| "Crime: #{x.name}, Date: #{x.date}, Neighborhood: #{x.neighborhood_name}"}
    end

    def self.m_wanted
        offense = Offense.group("perpetrator_id").order(Arel.sql("count(perpetrator_id) DESC")).limit(10)
        offense.map { |x|  self.p_name(x.perpetrator_id) }
        #offense
    end

    def self.list_of_perps
       puts Perpetrator.all.map { |x| x.name}.to_a
    end



end

