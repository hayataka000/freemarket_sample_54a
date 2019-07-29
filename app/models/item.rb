class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :user,optional:true
belongs_to :item,optional:true
belongs_to_active_hash :prefecture,optional:true
belongs_to_active_hash :delivery_fee,optional:true
has_one_attached :image
belongs_to :catery,optional:true
end
