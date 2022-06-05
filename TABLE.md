# テーブル設計
## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |

### Association

- has_many :posts
- has_many :games

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
- has_many :post_games
- has_many :games, through: :post_games

## games テーブル

| Column | Type       | Options                   |
| ------ | ---------- | ------------------------- |
| title  | string     | null: false               |
| user   | references | null: false, unique: true |

### Association

- belongs_to :user
- has_many :post_games
- has_many :posts, through: :post_games

## post_games テーブル

| Column | Type       | Options                   |
| ------ | ---------- | ------------------------- |
| post   | references | null: false, unique: true |
| game   | references | null: false, unique: true |

### Association

- belongs_to :post
- belongs_to :game