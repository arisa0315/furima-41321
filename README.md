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
  - has_many :purchases

### Items Table
| Column          | Type        | Options                       |
|-----------------|-------------|-------------------------------|
| name            | string      | null: false                   |
| description     | text        | null: false                   |
| category_id     | integer     | null: false, foreign_key: true|
| condition_id    | integer     | null: false, foreign_key: true|
| price           | integer     | null: false                   |
| user            | references  | null: false, foreign_key: true|

- Items
  - belongs_to :user
  - belongs_to :category
  - belongs_to :condition
  - has_one :purchase

### Categories Table
| Column  | Type   | Options     |
|---------|--------|-------------|
| name    | string | null: false |

- Categories
  - has_many :items

### Conditions Table
| Column  | Type   | Options     |
|---------|--------|-------------|
| name    | string | null: false |

- Conditions
  - has_many :items

### Purchases Table
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| item    | references | null: false, foreign_key: true|
| user    | references | null: false, foreign_key: true|

- Purchases
  - belongs_to :user
  - belongs_to :item
  - has_one :address

### Addresses Table
| Column       | Type       | Options                       |
|--------------|------------|-------------------------------|
| purchase     | references | null: false, foreign_key: true|
| postal_code  | string     | null: false                   |
| city         | string     | null: false                   |
| address      | string     | null: false                   |
| building     | string     |                               |
| phone_number | string     | null: false                   |

- Addresses
  - belongs_to :purchase
