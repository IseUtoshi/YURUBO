class Game < ApplicationRecord
  belongs_to :user
  has_many :post_games
  has_many :posts, through: :post_games
end
