class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    t.string :name,null: false
    t.string :iamge,null: false
    t.integer :price,null: false
    t.string :size,null: false
    t.string :condition,null: false
    t.string :delivery_fee,null: false
    t.string :delivery_date,null: false
    t.string :delivery_method,null: false
    t.string :shipping_area,null: false
    t.string :content,null: false
    t.integer :user_id, foreign_key: true
    t.integer :category_id, foreign_key: true
      t.timestamps
    end
  end
end
