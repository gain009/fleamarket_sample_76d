# README

## ER図
<img width="479" alt="de297f3d6d527442a00903dc81df4454" src="https://user-images.githubusercontent.com/64832157/83985356-e1a15000-a973-11ea-8e15-474c975ecdef.png">

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, index: true|
|encrypted_password|string|null: false|
|user_image|string||
|introduction|text||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|

### Association
- has_many :items
- has_one :destination
- has_one :card

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|integer|null: false, foreign_key: true, index: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|description|string|null: false|
|status|string|null: false|
|size|string|null: false|
|shipping_cost|integer|null: false|
|shipping_method|integer|null: false|
|shipping_date|sinteger|null: false|
|prefecture_id|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :images
- belongs_to :user
- belongs_to :category
- belongs_to :brand

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
### Association
- has_many :items
