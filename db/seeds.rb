# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Specialty.destroy_all
DoctorSpecialty.destroy_all

# 9 villes
# 11 spé
cities_array = [{name: "PARIS" , zip_code: "75000"}, {name: "TOULOUSE" , zip_code: "31000"}, {name: "NICE" , zip_code: "06000"}, {name: "NANTES" , zip_code: "44000"}, {name: "STRASBOURG" , zip_code: "67000"}, {name: "MONPELLIER" , zip_code: "34000"}, {name: "BORDEAUX" , zip_code: "33000"}, {name: "LILLE" , zip_code: "59000"}, {name: "RENNES" , zip_code: "35000"}]
specialties_array = ["médecine générale","orthopédie","gynécologie","ophtalmologie","chirurgie", "dermatologie", "gériatrie","neurologie", "médecine du travail","radiologie","psychiatrie"]

cities_array.each_with_index do |city_to_save, index|
    City.create(city_to_save)
    puts "#{index} city créées"
end

specialties_array.each_with_index do |spe , index|
    Specialty.create(name: spe)
    puts "#{index} spé créées"
end

50.times do
    Doctor.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , city: City.all[rand(0..8)] )
    puts "doc"
end

100. times do
    Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all[rand(0..8)])
    puts "patient"
end

100.times do
   doc = Doctor.all[rand(0..49)]
    Appointment.create(date: Faker::Date.between(from: '2021-09-23', to: '2022-09-25'),doctor: doc, patient: Patient.all[rand(0..99)], city: doc.city)
    puts "app"
end

100.times do
    DoctorSpecialty.create(doctor: Doctor.all[rand(0..49)], specialty: Specialty.all[rand(0..10)])
    puts "spé doc"
end
