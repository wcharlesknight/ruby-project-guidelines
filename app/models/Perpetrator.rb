require "awesome_print"

class Perpetrator < ActiveRecord::Base
    has_many :offenses
    has_many :neighborhoods, through: :offenses

    # def self.most_offenses
    #     offense = Offense.group("perpetrator_id").order("count(perpetrator_id) DESC").limit(10).to_a
    #     offense.map do |o|
    #         Perpetrator.where(id: o.perpetrator_id)
    #     end     
    # end

    def self.p_name(id)
       Perpetrator.where(id: id).map { |x| x.name }
    end

    def self.list_of_offenses(name)
        offenses = Perpetrator.where(name: name)
        list = offenses.map do |o|
            Offense.where(perpetrator_id: o.id).to_a 
        end
        list.each do |o|
            o.map { |x| puts "#{x.name} #{x.date} #{x.neighborhood_name}" }
        end
    end

    def self.most_offenses
       perp_ids = Offense.all.map { |x| x.perpetrator_id} #
       mostwanted = perp_ids.max_by { |x| perp_ids.count(x)}
       c = Perpetrator.where(id: mostwanted)
       ap c.map {|x| "#{x.name} Age: #{x.age} years old"} 
    end

    def self.list_of_perps
       puts Perpetrator.all.map { |x| x.name}.to_a
    end

end

