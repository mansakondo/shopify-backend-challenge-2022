class AddBaseToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :base, :boolean, null: false, default: false
    add_index :locations, [:inventory_id, :base], unique: true, where: "base = true"
  end
end
