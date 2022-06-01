class Post < ApplicationRecord

  belongs_to :user
  has_many :post_games
  has_many :games, through: :post_games
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :chat
  belongs_to :publish

  validates :chat_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :publish_id, numericality: { other_than: 1 , message: "can't be blank" } 

end
