class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :integer do |t|

      t.string :name, null: false
      t.string :price, null: false
      t.string :description, null: false
      t.string :status, null: false
      t.string :size, null: false
      t.string :shipping_area, null: false
      t.string :shipping_method, null: false
      t.string :shipping_date, null: false
      t.string :prefecture_id, null: false
      t.string :judgment
      t.integer :category_id, null: false
      t.integer :brand_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_foreign_key :items, :categories
    add_foreign_key :items, :brands
    add_foreign_key :items, :users
  end
end
