# memo-app-17110

# テーブル設計

## users テーブル

| Column   | Type    | Options                  |
| -------- | ------- | ------------------------ |
| name     | string  | null: false              |
| email    | string  | null: false unique: true |
| password | string  | null: false              |

### Association

- has_many :group_users
- has_many :groups, through: group_users
- has_many :memos
- has_many :comments

## groups テーブル

| Column     | Type     | Options       |
| ---------- | -------- | ------------- |
| name       | string   | null: false   |

### Association

- has_many :group_users
- has_many :users, through: group_users
- has_many :memos

## group_users テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| group      | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user


## memos テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| content     | text       | null: false                    |
| create_date | date       | null: false                    |
| user        | references | null: false, foreign_key: true |
| group       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| memo        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :memo