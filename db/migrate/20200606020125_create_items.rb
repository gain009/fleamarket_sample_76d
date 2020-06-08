class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :integer do |t|

      t.string :name, null: false
      t.string :price, null: false
      t.string :description, null: false
      t.string :status, null: false
      t.string :size, null: false
      t.integer :shipping_cost, null: false
      t.integer :shipping_method, null: false
      t.integer :shipping_date, null: false
      t.integer :prefecture_id, null: false
      t.integer :category_id, null: false
      t.integer :brand_id
      t.integer :user_id, null: false
      t.timestamps
    end
    add_foreign_key :items, :categories
    add_foreign_key :items, :brands
    add_foreign_key :items, :users
  end
end
