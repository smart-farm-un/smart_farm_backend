class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number, :integer
    add_column :users, :document_type, :string
    add_column :users, :document_number, :integer
    add_column :users, :birth_date, :date
    add_column :users, :state, :string
    add_column :users, :town, :string
    add_column :users, :role, :string
    add_column :users, :latitude, :decimal
    add_column :users, :longitude, :decimal
  end
end
