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
- has_many :buy_histories

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
- has_one :buy_histories

## buy_histories テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item             | references |             |
| user             | references |             |

### Association

- has_one :addresses
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| block_number       | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |
| buy_histories      | references |             |

### Association

- belongs_to :buy_histories