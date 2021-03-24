class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.datetime :start
      t.datetime :end
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
