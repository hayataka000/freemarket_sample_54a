class Item < ApplicationRecord
include ActiveModel::Validations
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :user
belongs_to_active_hash :prefecture
belongs_to_active_hash :delivery_fee
has_one_attached :image
belongs_to_active_hash :category
validates :name, :price, :condition, :delivery_date, :content, :image, presence: true
validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
enum status:{ 出品中: 0, 購入済み: 1 }
validates_with ImageAttachValidator
end
