class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone, index: true, commnet: '手机'
      t.integer :plate_number_count, default: 0

      t.timestamps null: false
    end
  end
end
