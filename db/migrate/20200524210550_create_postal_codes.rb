class CreatePostalCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :postal_codes do |t|
      t.string :code
      t.string :department
      t.integer :department_code
      t.string :city
      t.integer :city_code

      t.timestamps
    end
  end
end
