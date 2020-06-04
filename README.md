# README

## ER図
<img width="451" alt="8984708e9a2241f0e601a43237283a28" src="https://user-images.githubusercontent.com/64832157/83719275-afd97200-a671-11ea-89bb-58cd6b79c60a.png">

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
- has_many :products
- has_one :destinations
- has_one :cards

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
- belongs_to :users

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :users

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|price|string|null: false|
|description|string|null: false|
|status|string|null: false|
|size|string|null: false|
|shipping_area|string|null: false|
|shipping_method|string|null: false|
|shipping_date|string|null: false|
|prefecture_id|string|null: false|
|judgment|string||
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :images
- belongs_to :users
- belongs_to :categorys
- belongs_to :brands

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :products

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|index: true|
### Association
- has_many :products
