# テーブル設計
## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| name                | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |

### Association

- has_many :posts
- has_many :games
- has_many :follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
- has_many :followee, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
- has_many :followee_user, through: :follower, source: :followee
- has_many :follower_user, through: :followee, source: :follower

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

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :post_games
- has_many :posts, through: :post_games

## post_games テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |
| game   | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :game

## follows テーブル

| Column   | Type       | Options                                      |
| -------- | ---------- | -------------------------------------------- |
| follower | references | null: false, foreign_key: {to_table: :users} |
| followee | references | null: false, foreign_key: {to_table: :users} |

### Association

- belongs_to :follower, class_name: "User"
- belongs_to :followee, class_name: "User"

