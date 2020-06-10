class AddDepartmentToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :department, :string
  end
end
