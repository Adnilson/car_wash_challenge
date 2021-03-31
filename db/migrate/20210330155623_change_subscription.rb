class ChangeSubscription < ActiveRecord::Migration[6.1]
  def change
    rename_column :subscriptions, :start, :start_date
    rename_column :subscriptions, :end, :end_date
  end
end
