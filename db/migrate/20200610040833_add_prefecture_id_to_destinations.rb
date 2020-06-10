class AddPrefectureIdToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :prefecture_id, :integer, null: false
  end
end
