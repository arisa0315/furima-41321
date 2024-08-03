# README
## Database Design

### Users Table
| Column            | Type      | Options                       |
|-------------------|-----------|-------------------------------|
| id                | integer   | auto_increment primary key    |
| nickname          | string    | null: false                   |
| email             | string    | null: false, unique: true     |
| encrypted_password| string    | null: false                   |
| first_name        | string    | null: false                   |
| last_name         | string    | null: false                   |
| first_name_kana   | string    | null: false                   |
| last_name_kana    | string    | null: false                   |
| birthday          | date      | null: false                   |

### Items Table
| Column          | Type        | Options                       |
|-----------------|-------------|-------------------------------|
| id              | integer     | auto_increment primary key    |
| name            | string      | null: false                   |
| description     | text        | null: false                   |
| category_id     | integer     | null: false, foreign_key: true|
| condition_id    | integer     | null: false, foreign_key: true|
| price           | integer     | null: false                   |
| user_id         | integer     | null: false, foreign_key: true|
| prefecture_id   | integer     | null: false, foreign_key: true|
| shipping_fee_id | integer     | null: false, foreign_key: true|
| shipping_day_id | integer     | null: false, foreign_key: true|

### Categories Table
| Column        | Type      | Options                       |
|---------------|-----------|-------------------------------|
| id            | integer   | auto_increment primary key    |
| name          | string    | null: false                   |

### Conditions Table
| Column        | Type      | Options                       |
|---------------|-----------|-------------------------------|
| id            | integer   | auto_increment primary key    |
| name          | string    | null: false                   |

### ShippingFees Table
| Column        | Type      | Options                       |
|---------------|-----------|-------------------------------|
| id            | integer   | auto_increment primary key    |
| fee           | string    | null: false                   |

### ShippingDays Table
| Column        | Type      | Options                       |
|---------------|-----------|-------------------------------|
| id            | integer   | auto_increment primary key    |
| days          | string    | null: false                   |

### Purchases Table
| Column        | Type        | Options                       |
|---------------|-------------|-------------------------------|
| id            | integer     | auto_increment primary key    |
| item_id       | integer     | null: false, foreign_key: true|
| user_id       | integer     | null: false, foreign_key: true|

### Addresses Table
| Column        | Type        | Options                       |
|---------------|-------------|-------------------------------|
| id            | integer     | auto_increment primary key    |
| purchase_id   | integer     | null: false, foreign_key: true|
| postal_code   | string      | null: false                   |
| prefecture_id | integer     | null: false, foreign_key: true|
| city          | string      | null: false                   |
| address       | string      | null: false                   |
| building      | string      |                               |
| phone_number  | string      | null: false                   |

### Prefectures Table
| Column        | Type      | Options                       |
|---------------|-----------|-------------------------------|
| id            | integer   | auto_increment primary key    |
| name          | string    | null: false                   |

## Associations
- Users
  - has_many :items
  - has_many :purchases

- Items
  - belongs_to :user
  - belongs_to :category
  - belongs_to :condition
  - belongs_to :prefecture
  - belongs_to :shipping_fee
  - belongs_to :shipping_day
  - has_one :purchase

- Purchases
  - belongs_to :user
  - belongs_to :item
  - has_one :address

- Addresses
  - belongs_to :purchase

- Categories
  - has_many :items

- Conditions
  - has_many :items

- ShippingFees
  - has_many :items

- ShippingDays
  - has_many :items

- Prefectures
  - has_many :addresses
  - has_many :items
