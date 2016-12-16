class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :pinyin
      t.integer :sort
      t.integer :country_id, index: true

      t.timestamps
    end
    add_index :provinces, :name
    add_index :provinces, :pinyin
  end
end
