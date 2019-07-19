class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    t.string :name,null :false
    t.string :iamge,null :false
    t.integer :price,null :false
    t.string :size,null :false
    t.strign :condition,null :false
    t.string :delivery_fee,null :false
    t.string :delivery_date,null :false
    t.string :delivery_method,null :false
    t.string :shipping_area,null :false
    t.string :content,null :false
    t.integrer :user_id,null :false
    t.integer :category_id,null :false
      t.timestamps
    end
  end
end
