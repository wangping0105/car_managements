class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone, comment: '手机', index: true
      t.string :email, default: "", index: true, comment: '邮箱'
      t.string :name, comment: '用户名', after: :phone
      t.string :name_pinyin

      t.string :authentication_token, index: true
      t.datetime :activated
      t.integer :role, default: 0
      t.datetime :deleted_at

      t.timestamps null: false
    end

  end
end
