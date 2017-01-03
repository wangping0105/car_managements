class CreateCellContacts < ActiveRecord::Migration
  def change
    create_table :cell_contacts do |t|
      t.integer :contact_id, index: true
      t.integer :cell_id, index: true
      t.string :building_no, index: true, commnet: '栋号'
      t.string :room_no, index: true, commnet: '房间号'
      t.string :cell_address

      t.timestamps null: false
    end
  end
end
