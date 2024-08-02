# README
## Database Design

### Users Table
| Column            | Type    | Options                      |
|-------------------|---------|------------------------------|
| id                | INT     | AUTO_INCREMENT PRIMARY KEY   |
| nickname          | VARCHAR | NOT NULL                     |
| email             | VARCHAR | NOT NULL UNIQUE              |
| encrypted_password| VARCHAR | NOT NULL                     |
| first_name        | VARCHAR | NOT NULL                     |
| last_name         | VARCHAR | NOT NULL                     |
| first_name_kana   | VARCHAR | NOT NULL                     |
| last_name_kana    | VARCHAR | NOT NULL                     |
| birthday          | DATE    | NOT NULL                     |
| created_at        | DATETIME| NOT NULL                     |
| updated_at        | DATETIME| NOT NULL                     |

### Items Table
| Column        | Type    | Options                      |
|---------------|---------|------------------------------|
| id            | INT     | AUTO_INCREMENT PRIMARY KEY   |
| name          | VARCHAR | NOT NULL                     |
| description   | TEXT    | NOT NULL                     |
| category_id   | INT     | NOT NULL                     |
| condition_id  | INT     | NOT NULL                     |
| price         | INT     | NOT NULL                     |
| user_id       | INT     | NOT NULL FOREIGN KEY         |
| created_at    | DATETIME| NOT NULL                     |
| updated_at    | DATETIME| NOT NULL                     |

### Categories Table
| Column        | Type    | Options                      |
|---------------|---------|------------------------------|
| id            | INT     | AUTO_INCREMENT PRIMARY KEY   |
| name          | VARCHAR | NOT NULL                     |

### Conditions Table
| Column        | Type    | Options                      |
|---------------|---------|------------------------------|
| id            | INT     | AUTO_INCREMENT PRIMARY KEY   |
| name          | VARCHAR | NOT NULL                     |

### Purchases Table
| Column        | Type    | Options                      |
|---------------|---------|------------------------------|
| id            | INT     | AUTO_INCREMENT PRIMARY KEY   |
| item_id       | INT     | NOT NULL FOREIGN KEY         |
| user_id       | INT     | NOT NULL FOREIGN KEY         |
| created_at    | DATETIME| NOT NULL                     |
| updated_at    | DATETIME| NOT NULL                     |

### Addresses Table
| Column        | Type    | Options                      |
|---------------|---------|------------------------------|
| id            | INT     | AUTO_INCREMENT PRIMARY KEY   |
| purchase_id   | INT     | NOT NULL FOREIGN KEY         |
| postal_code   | VARCHAR | NOT NULL                     |
| prefecture_id | INT     | NOT NULL                     |
| city          | VARCHAR | NOT NULL                     |
| address       | VARCHAR | NOT NULL                     |
| building      | VARCHAR |                              |
| phone_number  | VARCHAR | NOT NULL                     |
| created_at    | DATETIME| NOT NULL                     |
| updated_at    | DATETIME| NOT NULL                     |

### Prefectures Table
| Column        | Type    | Options                      |
|---------------|---------|------------------------------|
| id            | INT     | AUTO_INCREMENT PRIMARY KEY   |
| name          | VARCHAR | NOT NULL                     |
