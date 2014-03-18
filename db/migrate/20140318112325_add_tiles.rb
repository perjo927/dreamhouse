class AddTiles < ActiveRecord::Migration
  def change
    add_column :rooms, :tiles, :string
  end
end
