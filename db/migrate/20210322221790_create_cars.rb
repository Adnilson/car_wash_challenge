class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :color
      t.decimal :price
      t.string :license_plate, uniqueness: true
      t.references :model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
