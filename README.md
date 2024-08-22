# README

## Database Design

### Users Table
| Column             | Type      | Options                       |
|--------------------|-----------|-------------------------------|
| nickname           | string    | null: false                   |
| email              | string    | null: false, unique: true     |
| encrypted_password | string    | null: false                   |
| first_name         | string    | null: false                   |
| last_name          | string    | null: false                   |
| first_name_kana    | string    | null: false                   |
| last_name_kana     | string    | null: false                   |
| birthday           | date      | null: false                   |

- Users
  - has_many :items
  - has_many :orders

### Items Table
| Column          | Type        | Options                       |
|-----------------|-------------|-------------------------------|
| name            | string      | null: false                   |
| description     | text        | null: false                   |
| category_id     | integer     | null: false                   |
| condition_id    | integer     | null: false                   |
| shipping_fee_id | integer     | null: false                   |
| prefecture_id   | integer     | null: false                   |
| shipping_days_id| integer     | null: false                   |
| price           | integer     | null: false                   |
| user            | references  | null: false, foreign_key: true|

- Items
  - belongs_to :user
  - has_one :order

### orders Table
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| item    | references | null: false, foreign_key: true|
| user    | references | null: false, foreign_key: true|

- orders
  - belongs_to :user
  - belongs_to :item
  - has_one :address

### Addresses Table
| Column           | Type       | Options                       |
|------------------|------------|-------------------------------|
| order            | references | null: false, foreign_key: true|
| postal_code      | string     | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     |                               |
| phone_number     | string     | null: false                   |
| prefecture_id    | integer    | null: false                   |

- Addresses
  - belongs_to :order
