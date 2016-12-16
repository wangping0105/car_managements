class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :pinyin
      t.references :province, index: true
      t.integer :sort

      t.timestamps
    end
    add_index :cities, :name
    add_index :cities, :pinyin
  end
end
