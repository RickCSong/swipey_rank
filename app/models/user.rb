class User < ActiveRecord::Base
  has_many :games, dependent: :destroy

  validates :username,
            presence: true

  validates :fullname,
            presence: true

  def max_score
    games.order('score DESC').first.score
  end

  def time_spent
    games.sum(:duration) / 1000
  end
end
