class Game < ApplicationRecord
  belongs_to :user
  has_many :post_games, dependent: :destroy
  has_many :posts, through: :post_games

  validates :title, presence: true
  validates :title, uniqueness: { scope: :user_id } 
  validates :user_id, presence: true

end
