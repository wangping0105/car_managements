class CreateCells < ActiveRecord::Migration
  def change
    create_table :cells do |t|
      t.integer :user_id, index: true
      t.integer :status, index: true, default: 0
      t.string :number, index: true, commnet: '小区编号'
      t.string :name, commnet: '小区名称'
      t.integer :cell_contact_count, default: 0

      t.timestamps null: false
    end
  end
end
