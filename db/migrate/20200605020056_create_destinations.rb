class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations, id: :integer do |t|

      t.string :destination_family_name, null: false
      t.string :destination_first_name, null: false
      t.string :destination_family_name_kana, null: false
      t.string :destination_first_name_kana, null: false
      t.string :post_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number
      t.integer :user_id, null: false
      t.timestamps
    end
    add_foreign_key :destinations, :users
    add_index :destinations, :user_id
  end
end
