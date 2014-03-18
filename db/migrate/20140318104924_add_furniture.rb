class AddFurniture < ActiveRecord::Migration
  def change
    add_column :rooms,:bathtub, :string
  end
end
