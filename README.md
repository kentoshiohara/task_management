# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| name                  | string | null: false              |
| email                 | string | null: false, unique: true|
| encrypted_password    | string | null: false              |


### Association
- has_many :lists, dependent: :destroy

## lists テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| title                 | t.string   | null: false       |
| position              | t.integer  | null: false       |
| user                  | references | foreign_key: true |

### Association
-  belongs_to :user
-  has_many :cards

## cards テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| title                 | t.string   | null: false       |
| memo                  | t.text     | null: false       |
| position              | t.integer  | null: false       |
| list                  | references | foreign_key: true |


### Association
-  belongs_to :list
