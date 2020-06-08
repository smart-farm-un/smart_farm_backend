class CreateReferencePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :reference_prices do |t|
      t.float :unitPrice
      t.string :presentation
      t.string :unitMeasure
      t.date :date_of_price

      t.timestamps
    end
  end
end
