# テーブル設計

## users　テーブル

| Column             | Type    | Option      |
| ------------------ | ------- | --------    |
| nickname           | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |


###Association
-has_many :items
-has_many :orders


## items テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | -----------------------------  |
| category_id        | integer    | null: false                    | 
| price              | integer    | null: false                    |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true | 

###Association
-belongs_to :user
-has_one :order


## orders　テーブル

| Column             | Type       | Option                          |
| ------------------ | ---------- | ------------------------------  |
| user               | references | null: false , foreign_key: true | 
| item               | references | null: false , foreign_key: true |

###Association
-belongs_to :user
-belongs_to :item
-has_one :address


## addresses テーブル

| Column           | Type       | Option                          |
| ---------------- | -------    | ------------------------------- |
| zip              | string     | null: false                     |
| prefecture_id    | integer    | null: false                     |
| city             | string     | null: false                     |
| block            | string     | null: false                     |
| building         | string     |                                 |
| phone_number     | string     | null: false                     |
| order            | references | null: false , foreign_key: true |

###Association
-belongs_to :order


