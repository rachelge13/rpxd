class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
    	t.integer :position

      t.timestamps
  end
  end
end
