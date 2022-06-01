class Post < ApplicationRecord

  belongs_to :user
  has_many :post_games
  has_many :games, through: :post_games
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :chat
  belongs_to :publish

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :chat_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :publish_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :user_id, presence: true

  validate :time_mismatch

  def time_mismatch
    errors.add(:end_time, "終了時刻が開始時刻の前です") if end_time < start_time
  end

end
