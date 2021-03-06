# Table Design

## users table

| Column             | Type   | Options                |
| ------------------ | ------ | ---------------------- |
| nickname           | string | null:false             |
| email              | string | null:false,unique:true |
| encrypted_password | string | null: false            |
| first_name         | string | null: false            |
| family_name        | string | null: false            |
| first_name_kana    | string | null: false            |
| family_name_kana   | string | null: false            |
| birthday           | date    | null: false           |

### Association

- has_many :items
- has_many :purchase_histories


## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| name               | string     | null: false                   |
| description        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| status_id          | integer    | null: false                   |
| shipping_charge_id | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| delivery_time_id   | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | foreign_key:true |

出品画像(image)に関しては Active Storageで編集します

### Association

- belongs_to :user
- has_one :purchase_history
  has_one_attached :image  

## purchase_histories テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references |  foreign_key:true |
| item    | references |  foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :sending_address


## sending_addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| city                 | string     | null: false                    |
| house_number         | string     | null: false                    |
| building_name        | string     | 不要                            |
| phone_number         | string     | null: false                    |
| purchase_history     | references | foreign_key: true |

### Association

- belongs_to :purchase_history
