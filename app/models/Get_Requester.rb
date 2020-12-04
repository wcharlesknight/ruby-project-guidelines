
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


  


end



