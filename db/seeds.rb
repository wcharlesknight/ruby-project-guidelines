Perpetrator.destroy_all

100 times do
    Perpetrator.create(name:Faker::Name.name, age:rand(15..65), gender: Faker::Gender.type, offense_id: Offense.all.sample.id) 
end
