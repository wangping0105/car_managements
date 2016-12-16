class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.float    :lat
      t.float    :lng
      t.integer  :addressable_id, index: true
      t.string   :addressable_type
      t.integer  :country_id, index: true
      t.integer  :province_id, index: true
      t.integer  :city_id, index: true
      t.integer  :district_id, index: true
      t.string   :detail_address
      t.integer  :address_type, default: 0
      t.datetime :created_at
      t.datetime :updated_at
      
      t.timestamps null: false
    end
    add_index :addresses, [:lat, :lng]
  end
end
