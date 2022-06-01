class PostGame < ApplicationRecord
  belongs_to :post
  belongs_to :game

  validates :post_id, presence: true
  validates :game_id, presence: true

end
