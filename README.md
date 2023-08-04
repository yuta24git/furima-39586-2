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
| birth_date         | date   | null: false               |

- has_many :items
- has_one :buyers

## items テーブル

| Column            | Type       | Options                        |
| --------------    | ---------- | ------------------------------ |
| title             | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| situation_id      | integer    | null: false                    |
| responsibility_id | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| number_of_days_id | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false,foreign_key: true  |


-belongs_to :user
-has_one :buyer

## buyers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |

-belongs_to :user
-belongs_to :item
-has_many :addresses

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

-belongs_to :buyer