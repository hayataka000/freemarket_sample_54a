class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    t.string :name, null: false
    t.integer :price, null: false
    t.string :size, null: true
    t.string :condition, null: false
    t.string :delivery_fee_id, null: false
    t.string :delivery_date, null: false
    t.string :delivery_method ,null: true
    t.string :prefecture_id, null: false
    t.string :content, null: false
    t.integer :user_id, foreign_key: true, null: false
    t.integer :category_id, null: false
    t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
