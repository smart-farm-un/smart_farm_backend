class CreateCrops < ActiveRecord::Migration[5.1]
  def change
    create_table :crops do |t|
      t.string :crop_type
      t.date :sowing_date
      t.date :harvesting_planned_date
      t.date :actual_harvesting_date
      t.integer :sowing_area
      t.references :terrain, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
