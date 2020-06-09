class AddColumnToItems2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :size, :integer
    remove_column :items, :status, :integer

    add_column :items, :size_id, :integer
    add_column :items, :status_id, :integer
  end
end
