class AddDestinationFamilyNameKanaToDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :destination_family_name_kana, :string
    add_column :destinations, :destination_family_name_kana, :string, null: false
  end
end
