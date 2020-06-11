class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_method, :integer
    remove_column :items, :shipping_cost, :integer
    remove_column :items, :shipping_date, :integer

    add_column :items, :shipping_method_id, :integer, null: false
    add_column :items, :shipping_cost_id, :integer, null: false
    add_column :items, :shipping_date_id, :integer, null: false
  end
end
