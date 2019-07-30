class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    t.string :name,null: false
    t.integer :price,null: false
    t.string :size,null: true
    t.string :condition,null: true
    t.string :delivery_fee_id,null: true
    t.string :delivery_date,null: true
    t.string :delivery_method,null: true
    t.string :prefecture_id,null: true
    t.string :content,null: true
    t.integer :user_id, foreign_key: true
    t.integer :category_id,null: true
      t.timestamps
    end
  end
end
