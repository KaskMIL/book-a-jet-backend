# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


p "Seed started"

p "Creating jets"
require File.expand_path('db/seeds/seeds_jets', Rails.root)

p "---------------------"

p "Created #{Jet.count} jets"
p "Seed finished"