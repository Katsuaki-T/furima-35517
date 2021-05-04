# Table Design

## users table

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null:false  |
| email            | string | null:false  |
| password         | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :items
- has_one :purchase_histories


## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| description     | text       | null: false                   |
| category        | string     | null: false                   |
| status          | string     | null: false                   |
| shipping_charge | string     | null: false                   |
| prefecture      | string     | null: false                   |
| delivery_time   | string     | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false, foreign_key:true |

出品画像(image)に関しては Active Storageで編集します

### Association

- belongs_to :user
- has_one :purchase_history


## purchase_histories テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null: false, foreign_key:true |
| item    | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :sending_address


## sending_addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| prefecture           | integer    | null: false                    |
| city                 | string     | null: false                    |
| house_number         | string     | null: false                    |
| building_name        | string     | null: false                    |
| phone_number         | string     | null: false                    |
| purchase_history     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history
- belongs_to :user