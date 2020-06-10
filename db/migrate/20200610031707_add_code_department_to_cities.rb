class AddCodeDepartmentToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :code_department, :integer
  end
end
