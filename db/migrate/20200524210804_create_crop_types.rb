class CreateCropTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :crop_types do |t|
      t.string :name
      t.string :description
      t.string :scientificName

      t.timestamps
    end
  end
end
