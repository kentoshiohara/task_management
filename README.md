# アプリケーション名
Task Management

# アプリケーション概要
日々のタスクを管理する為に作成したアプリケーション

# 利用方法
1. タスクカードを振り分ける為のリストを作成する。
2. リスト作成後、各リストにTo-doタスクを追加する。

# 実装した機能についての画像やGIFおよびその説明
・ログイン画面
[![Image from Gyazo](https://i.gyazo.com/8c15b51541f9ebe509d9462d42120691.gif)](https://gyazo.com/8c15b51541f9ebe509d9462d42120691)

・リスト登録画面
[![Image from Gyazo](https://i.gyazo.com/3d0f941a0b133b236cfd1592a1e214b5.gif)](https://gyazo.com/3d0f941a0b133b236cfd1592a1e214b5)

・カード登録画面
[![Image from Gyazo](https://i.gyazo.com/6118c43473bf03985b891b9966339bec.gif)](https://gyazo.com/6118c43473bf03985b891b9966339bec)

・リスト、カード移動機能画面
[![Image from Gyazo](https://i.gyazo.com/14576a8810993a7c1ccfaa70ae728541.gif)](https://gyazo.com/14576a8810993a7c1ccfaa70ae728541)

# ER図
[![Image from Gyazo](https://i.gyazo.com/21a2f5b885af862cc51f44e707eba912.png)](https://gyazo.com/21a2f5b885af862cc51f44e707eba912)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/1ae1dc321c539942011a297c4dee7b6d.png)](https://gyazo.com/1ae1dc321c539942011a297c4dee7b6d)

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

