class AddPositionTodoPlayer < ActiveRecord::Migration
  def change
    	add_column :players, :position, :integer

      t.timestamps
  end
end
