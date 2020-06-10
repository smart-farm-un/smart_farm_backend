class AddRegionToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :region, :string
  end
end
