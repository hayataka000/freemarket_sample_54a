## users
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_furigana|string|null: false|
|password|string|null: false|
|mail|string|null: false, unique: true|
|nickname|string|null: false|
|tel|string|null: false, unique: true|
|birthday|date|null: false|


### Assosiation
- has_many :items
- has_many :comments
- has_many :trades, through: :users_trades
- has_many :addresses
- has_many :nices
- has_many :trades
- has_many :evaluations
- has_one :credit_card

## items
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|price|integer|null: false|
|size|string|null: false|
|condition|string|null: false|
|delivery_fee|string|null: false|
|delivery_date|string|null: false|
|delivery_method|string|null: false|
|shipping_area|string|null: false|
|content|text|null: false|


### Assosiation
- has_many :comments
- has_many :nices
- has_many :brands
- belongs_to :user
- belongs_to :category
- has_one :trade

## evaluations
|Column|Type|Options|
|------|----|-------|
|score|string|null: false|

### Assosiation
- belongs_to :user

## addresses
|Column|Type|Options|
|------|----|-------|
|zipcode|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|street_number|string|null: false|
|building_name|string||
|tel|string|null: false|


### Assosiation
- belongs_to :user
- has_many :trades

## comments
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|created_at|datetime|null: false|

### Assosiation

## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Assosiation
- belongs_to :item

## credit_cards
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|expiration_date|string|null: false|
|security_code|integer|null: false|

### Assosiation
- has_one :user
- has_many :trades

## trades
|Column|Type|Options|
|------|----|-------|
|exhibitor|string|null: false, unique: true|
|date|datetime|null: false|

### Assosiation
- belongs_to :user, through: :users_trades
- belongs_to :address
- belongs_to :credit_card
- has_one :item
- has_one :buyer

## categories
|Column|Type|Options|
|------|----|-------|
|category_large|string|null: false|
|category_middle|string|null: false|
|category_small|string|null: false|

### Assosiation
- has_many: items

## nices
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|

### Assosiation
- belongs_to :item
- belongs_to :user

## buyers
|Column|Type|Options|
|------|----|-------|

### Assosiation
- has_one :trade