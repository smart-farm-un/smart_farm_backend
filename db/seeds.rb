# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv' 

CSV.foreach('db/data/cities.csv', :headers => true) do |row|
    City.create!(row.to_hash)
end

City.select(:code_department, :department).group(:code_department, :department).each{|r|  Department.create!(name: r.department, code: r.code_department)}
