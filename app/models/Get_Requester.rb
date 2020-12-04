
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

  def self.parse
    JSON.parse(get_programs) 
  end

  def self.neighborhoods
    # we use the JSON library to parse the API response into nicely formatted JSON
      programs = JSON.parse(get_programs)
      programs.collect { |program| program['mcpp'] }.uniq
  end


  # def offense_name
  #   # we use the JSON library to parse the API response into nicely formatted JSON
  #     programs = JSON.parse(self.get_programs)
  #     programs.collect do |program|
  #       program['offense']       
  #     end
  # end

  # def self.offense_date
  #   programs = JSON.parse(get_programs)
  #   programs.collect do |program|
  #     program['report_datetime']  
  #   end
  # end

  # def self.offense_id
  #   programs = JSON.parse(get_programs)
  #   programs.collect do |program|
  #     program['offense_id']  
  #   end
  # end


end



