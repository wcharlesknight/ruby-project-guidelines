class Offense < ActiveRecord::Base
    belongs_to :perpetrator
    belongs_to :neighborhood

    def self.dangerous_month
        datetime = Offense.all.map { |x| x.date }.join(" ")
        date = datetime.split("-")
        s = date.max_by { |x| date.count(x) }
        if s == "01"
            ap "January had the most crimes with #{date.count(s)}"
        elsif s == "02"
            ap "February had the most crimes with #{date.count(s)}"
        elsif s == "03"
            ap "March had the most crimes with #{date.count(s)}"
        elsif s == "04"
            ap "April had the most crimes with #{date.count(s)}"
        elsif s == "05"
            ap "May had the most crimes with #{date.count(s)}"
        elsif s == "06"
            ap "June had the most crimes with #{date.count(s)}"
        elsif s == "07"
            ap "July had the most crimes with #{date.count(s)}"
        elsif s == "08"
            ap "August had the most crimes with #{date.count(s)}"
        elsif s == "09"
            ap "September had the most crimes with #{date.count(s)}"
        elsif s == "10"
            ap "October had the most crimes with #{date.count(s)}"
        elsif s == "11"
            ap "November had the most crimes with #{date.count(s)}"
        else
            ap "December had the most crimes with #{date.count(s)}"
        end
    end

    def self.count(name)
        self.where(name: name).count
    end

    def self.most_common_offense
        top = Offense.group("name").order(Arel.sql("count(name) DESC")).limit(5)
        top.each_with_index.map {|x, index| ap "#{index + 1}. #{x.name} | Occurences: #{self.count(x.name)}" } 
    end

    ##

end