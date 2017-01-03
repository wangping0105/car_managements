class CreatePlateNumbers < ActiveRecord::Migration
  def change
    create_table :plate_numbers do |t|
      t.string :number, index: true, commnet: '车牌号'
      t.integer :car_id, index: true
      t.integer :contact_id, index: true

      t.timestamps null: false
    end
  end
end
