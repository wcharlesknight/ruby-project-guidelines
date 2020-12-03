require 'faker'
Perpetrator.destroy_all
Neighborhood.destroy_all
Offense.destroy_all 


100.times do
    Perpetrator.create(name:Faker::Name.name, age:rand(15..65), gender: Faker::Gender.type) 
end

Neighborhood.create(name: Neighboroods.all.each {|x| x})

#GetPrograms.each do |x
Offense.create(name: GetPrograms.offense_name, date: GetPrograms.offense_date, neighborhood_id: Neighborhood.all.sample.id, perpetrator_id: Perpetrator.all.sample.id)


