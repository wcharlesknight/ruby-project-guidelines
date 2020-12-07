require 'faker'
require_all 'app'

Perpetrator.destroy_all
#Neighborhood.destroy_all
#Offense.destroy_all 


100.times do
    Perpetrator.create(name:Faker::Name.name, age:rand(15..65), gender: Faker::Gender.type) 
end

GetPrograms.neighborhoods.each do |x|
    Neighborhood.create(name: x)
end

GetPrograms.parse.each do |x|
    Offense.create(name: x['offense'], date: x['report_datetime'], neighborhood_name: x['mcpp'], perpetrator_id: Perpetrator.all.sample.id)
end

puts 'done'
