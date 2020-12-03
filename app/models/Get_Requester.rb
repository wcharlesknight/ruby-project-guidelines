
require 'net/http'
require 'open-uri'
require 'json'


class GetPrograms

  URL = "https://data.seattle.gov/resource/tazs-3rd5.json"

  def self.get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def self.all
    programs = JSON.parse(get_programs)
      programs.collect do |program|
        program
      end
  end

  def self.neighborhoods
    # we use the JSON library to parse the API response into nicely formatted JSON
      programs = JSON.parse(get_programs)
      programs.collect do |program|
        program['mcpp']       
      end
  end


  def self.offense_name
    # we use the JSON library to parse the API response into nicely formatted JSON
      programs = JSON.parse(get_programs)
      programs.collect do |program|
        program['offense']       
      end
  end

  def self.offense_date
    programs = JSON.parse(get_programs)
    programs.collect do |program|
      program['report_datetime']  
    end
  end

  def self.offense_id
    programs = JSON.parse(get_programs)
    programs.collect do |program|
      program['offense_id']  
    end
  end


end

# offense_name = GetPrograms.new.offense_name
# neighborhoods = GetPrograms.new.neighborhoods.uniq
# offense_date = GetPrograms.new.offense_date
puts GetPrograms.offense_name.class


