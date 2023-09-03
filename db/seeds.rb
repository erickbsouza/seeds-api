require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
benefiteds = Benefited.create([
    {
        name:Faker::Movies::StarWars.character,
        contact: '85985638551',
        email: Faker::Movies::StarWars.character + '@gmail.com'
    },
    {
        name:Faker::Movies::StarWars.character,
        contact: '85985638551',
        email: Faker::Movies::StarWars.character + '@gmail.com'
    },
    {
        name:Faker::Movies::StarWars.character,
        contact: '85985638551',
        email: Faker::Movies::StarWars.character + '@gmail.com'
    },
    {
        name:Faker::Movies::StarWars.character,
        contact: '85985638551',
        email: Faker::Movies::StarWars.character + '@gmail.com'
    }
])

analyses =  Analyse.create([{
        responsible:Faker::Movies::StarWars.character,
        comments:Faker::Movies::StarWars.quote,
        date_analyse: rand(6.months).seconds.ago,
        benefited: Benefited.find(Benefited.pluck(:id).sample)
    },
    {
        responsible:Faker::Movies::StarWars.character,
        comments:Faker::Movies::StarWars.quote,
        date_analyse: rand(6.months).seconds.ago,
        benefited: Benefited.find(Benefited.pluck(:id).sample)
    }
    ])
##results
(1..100).each do |reg|
    high_vigor = rand(40)
    fungus = rand(10)
    physical_damage = rand(15)
    wrinkled = rand(20)
    chemical_damage = rand(5)
    seeds_total = high_vigor + fungus+ physical_damage + wrinkled + chemical_damage
    AnalysisResult.create(
        seeds_total: seeds_total,
        high_vigor: high_vigor,
        fungus: fungus,
        physical_damage: physical_damage,
        wrinkled:wrinkled ,
        chemical_damage: chemical_damage,
        analyse: Analyse.find(Analyse.pluck(:id).sample)
    )   
end



