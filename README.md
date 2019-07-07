## users
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_furigana|string|null: false|
|password|string|null: false, limit: =>|
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
- has_one :credit_card
- has_one :evaluation
- 


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
- belongs_to :users


## evaluations
|Column|Type|Options|
|------|----|-------|
|good|string|null: true|
|normal|string|null: true|
|bad|string|null: true|
|total|string|null: false|

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

## credit_cards
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|expiration_date|string|null: false|
|security_code|integer|null: false|

### Assosiation

## trades
|Column|Type|Options|
|------|----|-------|
|buyer|string|null: false, unique: true|
|exhibitor|string|null: false, unique: true|
|date|datetime|null: false|

## categories
|Column|Type|Options|
|------|----|-------|
|category_large|string|null: false|
|category_middle|string|null: false|
|category_small|string|null: false|


## nices
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|

###Assosiation
- belongs_to :user
