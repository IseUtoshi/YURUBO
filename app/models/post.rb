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
  validate :time_limit
  validate :time_overlap

  def time_mismatch
    errors.add(:end_time, "終了時刻が開始時刻の前か同じです") if self.end_time <= self.start_time
    errors.add(:start_time, "開始時刻が現在より前です") if self.start_time < Time.now
  end

  def time_limit
    t = Time.parse(self.start_time)
    if self.end_time >= t.end_of_day.since(12.hours)
      errors.add(:end_time, "終了時刻が指示範囲外です") 
    end
  end

  def time_overlap
    if Post.where('end_time > ? and ? > start_time', self.start_time, self.end_time)
      errors.add(:end_time, "期間が重複しています") 
    end
  end

end
