class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :posts
  has_many :games
  has_many :follower, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followee, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
  has_many :follow_user, through: :follower, source: :followee
  has_many :follower_user, through: :followee, source: :follower

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followee_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followee_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    follow_user.include?(user)
  end

  # フォローされていればtrueを返す
  def followed?(user)
    follower_user.include?(user)
  end

  # 検索メソッド
  def self.search(search)
    User.where('name LIKE(?)', "%#{search}%")
  end

end
