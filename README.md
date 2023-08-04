## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | DATE   | null: false               |

- has_many :items
- has_one :buyers

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    |
| explanation    | text       | null: false                    |
| category       | string     | null: false                    |
| situation      | string     | null: false                    |
| responsibility | string     | null: false                    |
| region         | string     | null: false                    |
| price          | string     | null: false                    |
| user           | reference  | null: false,foreign_key: true  |


-belongs_to :user
-has_one :buyer

## buyers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_number      | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :item