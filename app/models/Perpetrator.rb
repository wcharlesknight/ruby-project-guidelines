require "awesome_print"

class Perpetrator < ActiveRecord::Base
    has_many :offenses
    has_many :neighborhoods, through: :offenses


    def self.p_name(id)
        Perpetrator.where(id: id).map { |x| x.name } 
    end

    def self.list_of_offenses(name)
        offenses = Perpetrator.where(name: name)
        list = offenses.map do |o|
            Offense.where(perpetrator_id: o.id).to_a 
        end
        # list.each do |o|
        #     o.map { |x| puts "#{x.name} #{x.date} #{x.neighborhood_name}" }
        # end
    end

    def self.m_wanted
        offense = Offense.group("perpetrator_id").order(Arel.sql("count(perpetrator_id) DESC")).limit(10)
        offense.map { |x|  "#{self.p_name(x.perpetrator_id)}" }
        #offense
    end

    def self.list_of_perps
       puts Perpetrator.all.map { |x| x.name}.to_a
    end

end

