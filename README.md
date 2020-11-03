# テーブル設計

## users　テーブル

| Column           | Type    | Option   |
| ---------------- | ------- | -------- |
| nickname         | string  | NOT NULL |
| family_name      | string  | NOT NULL |
| first_name       | string  | NOT NULL |
| family_name_kana | string  | NOT NULL |
| first_name_kana  | string  | NOT NULL |
| email            | string  | NOT NULL |
| password         | string  | NOT NULL |
| birth_year       | integer | NOT NULL |
| birth_month      | integer | NOT NULL |
| birth_day        | integer | NOT NULL |

###Association
-has_many :items
-has_many :orders


## items テーブル

| Column           | Type       | Option      |
| ---------------- | ---------- | ----------- |
| category         | string     | NOT NULL    | 
| price            | integer    | NOT NULL    |
| image            |            | NOT NULL    |
| item_name        | string     | NOT NULL    |
| condition        | string     | NOT NULL    |
| delivery_charge  | integer    | NOT NULL    |
| prefecture       | string     | NOT NULL    |
| delivery_days    | integer    | NOT NULL    |
| user             | references |             | 

###Association
-belongs_to :user
-has_one :order


## orders テーブル

| Column           | Type       | Option      |
| ---------------- | -------    | ----------- |
| zip              | integer    | NOT NULL    |
| prefecture       | string     | NOT NULL    |
| city             | string     | NOT NULL    |
| block            | integer    | NOT NULL    |
| building         | string     |             |
| phone_number     | integer    | NOT NULL    |
| user             | references |             |
| item             | references |             |

###Association
-belongs_to :user
-belongs_to :item
