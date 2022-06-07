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
  has_many :followee_user, through: :follower, source: :followee
  has_many :follower_user, through: :followee, source: :follower
end
