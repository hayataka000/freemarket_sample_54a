class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :description, :text
    add_column :items, :category, :string
    add_column :items, :condition, :string
    add_column :items, :delivery_burden, :string
    add_column :items, :shipping_area, :string
    add_column :items, :delivery_date, :string
    add_column :items, :price, :integer
  end
end
