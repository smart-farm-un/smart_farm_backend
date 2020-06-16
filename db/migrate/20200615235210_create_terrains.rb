class CreateTerrains < ActiveRecord::Migration[5.1]
  def change
    create_table :terrains do |t|
      t.string :name
      t.integer :area
      t.string :source_energy
      t.string :source_water
      t.string :state_path
      t.string :close_town
      t.decimal :latitude
      t.decimal :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
