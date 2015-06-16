class AddPositionToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :position, :integer
    add_index :players, :position
  end
end
