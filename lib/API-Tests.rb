
require 'net/http'
require 'open-uri'
require 'json'

class GetPrograms

  URL = "https://data.seattle.gov/resource/tazs-3rd5.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def neighborhoods
    # we use the JSON library to parse the API response into nicely formatted JSON
      programs = JSON.parse(self.get_programs)
      programs.collect do |program|
        program['mcpp']  
      end
    end

    def offense_types
        # we use the JSON library to parse the API response into nicely formatted JSON
          programs = JSON.parse(self.get_programs)
          programs.collect do |program|
            program['offense']  
        end
    end    

end

# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.offense_types.uniq 
