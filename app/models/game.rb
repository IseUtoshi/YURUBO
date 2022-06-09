class Game < ApplicationRecord
  belongs_to :user
  has_many :post_games, dependent: :destroy
  has_many :posts, through: :post_games

  validates :title, presence: true
  validates :title, uniqueness: { scope: :user_id } 
  validates :user_id, presence: true

  validate :admin_title, on: :game_save

  def admin_title
    if Game.find_by(title: self.title, user_id: 1)
      errors.add(:base, "既に登録済みのタイトルです") 
    end
  end
end
