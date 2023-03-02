
## データベース設計
[![Image from Gyazo](https://i.gyazo.com/21a2f5b885af862cc51f44e707eba912.png)](https://gyazo.com/21a2f5b885af862cc51f44e707eba912)

## 画面遷移図


# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| name                  | string | null: false              |
| email                 | string | null: false, unique: true|
| encrypted_password    | string | null: false              |

### Association
- has_many :lists, dependent: :destroy
- has_many :memberships, dependent: :destroy
- has_many :team_lists, through: :memberships, source: :list


## lists テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| title                 | t.string   | null: false       |
| position              | t.integer  | null: false       |
| user                  | references | foreign_key: true |

### Association
<!-- -  belongs_to :user -->
-  has_many :cards
-  has_many :memberships, dependent: :destroy
-  has_many :users, through: :memberships


## cards テーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| title                 | t.string   | null: false       |
| memo                  | t.text     | null: false       |
| position              | t.integer  | null: false       |
| list                  | references | foreign_key: true |


### Association
-  belongs_to :list
-  belongs_to :user


## memberships テーブル
| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| list                  | references | foreign_key: true |
| user                  | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :list

