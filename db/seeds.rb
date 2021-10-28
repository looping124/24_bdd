# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Lesson.destroy_all
Specialty.destroy_all

#Création de 3 villes
paris = City.create(name:"Paris")
nice = City.create(name:"Nice")
lyon = City.create(name:"Lyon")
cities_array = [paris,nice,lyon]

#Création de 3 spécialités
generaliste = Specialty.create(name:"Généraliste")
chirurgien = Specialty.create(name:"Chirurgien")
pediatre = Specialty.create(name:"Pédiatre")
specialties_array=[generaliste,chirurgien,pediatre]


#Création de 20 docteurs et patients
20.times do |index|
Doctor.create(first_name:Faker::Name.first_name ,last_name:Faker::Name.last_name, zip_code:rand(95999), city: cities_array[rand(cities_array.size)])
puts "docteur #{index+1} créé"
Patient.create(first_name:Faker::Name.first_name ,last_name:Faker::Name.last_name, city: cities_array[rand(cities_array.size)])
puts "patient #{index+1} créé"
end

#Création de 50 spécialités
50.times do |index|
Lesson.create(doctor: Doctor.all[rand(0..(Doctor.all.size)-1)], specialty: specialties_array[rand(specialties_array.size)])
puts "spécialité #{index+1} créé"
end

#Création de 50 RDV
50.times do |index|
Appointment.create(doctor: Doctor.all[rand(0..(Doctor.all.size)-1)], patient: Patient.all[rand(0..(Doctor.all.size)-1)], date:Faker::Time.between(from: DateTime.now, to: DateTime.now+365, format: :default), city: cities_array[rand(cities_array.size)])
puts "rdv #{index+1} créé"
end
