class CreateUserCells < ActiveRecord::Migration
  def change
    create_table :user_cells do |t|
      t.integer :user_id
      t.integer :cell_id

      t.timestamps null: false
    end
  end
end
