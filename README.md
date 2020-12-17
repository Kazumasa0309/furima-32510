# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first-name      | string | null: false |
| last-name       | string | null: false |
| first-name-kana | string | null: false |
| last-name-kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| state       | string     | null: false                    |
| price       | integer    | null: false                    |
| order-check | boolean    |                                |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| items_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders
- has_one :receiver

## receiver テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| orders_id    | references | null: false, foreign_key: true |
| postal-code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| phone-number | integer    | null: false                    |

### Association

- belongs_to :orders