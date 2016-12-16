class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.string :pinyin
      t.references :city, index: true
      t.integer :sort

      t.timestamps
    end
    add_index :districts, :name
    add_index :districts, :pinyin
  end
end
