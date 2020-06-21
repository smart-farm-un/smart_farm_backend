require 'csv' 

CSV.foreach('db/data/crops_type.csv', :headers => true) do |row|
    CropType.create!(row.to_hash)
end

#City.select(:code_department, :department).group(:code_department, :department).each{|r|  Department.create!(name: r.department, code: r.code_department)}
