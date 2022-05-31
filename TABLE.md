# テーブル設計
## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |

### Association

- has_many :posts

## posts テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| start_time | datetime   | null: false                    |
| end_time   | datetime   | null: false                    |
| chat_id    | integer    | null: false                    |
| publish_id | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user