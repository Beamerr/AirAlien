class AddCorrectColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :rooms, :bathroom, :bath_room
  end
end
