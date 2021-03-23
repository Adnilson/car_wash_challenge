class CreateModels < ActiveRecord::Migration[6.1]
  def change
    create_table :models do |t|
      t.string :name, uniqueness: true
      t.references :maker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
