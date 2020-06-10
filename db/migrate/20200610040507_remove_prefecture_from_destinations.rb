class RemovePrefectureFromDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :prefecture, :string
  end
end
