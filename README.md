# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | data   | null: false              |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| name                   | string     | null: false |
| info                   | text       | null: false |
| price                  | integer    | null: false |
| category_id            | integer    | null: false |
| sales_status_id        | integer    | null: false |
| shipping_fee_status_id | integer    | null: false |
| prefecture_id          | integer    | null: false |
| scheduled_delivery_id  | integer    | null: false |
| user                   | references |             |

### Association

- belongs_to :user
- has_one :buyer

## Buyers テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| token         | string     | null: false |
| postal_code   | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| addresses     | string     | null: false |
| building      | string     | null: false |
| phone number  | string     | null: false |
| item          | references |             |
| user          | references |             |

### Association

- belongs_to :user
- belongs_to :item