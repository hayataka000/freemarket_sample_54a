class RenameTitreColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    def change
      rename_column :items, :iamge, :image
    end
  end
end
