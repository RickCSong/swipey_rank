class User < ActiveRecord::Base
  has_many :games, dependent: :destroy

  validates :username,
            presence: true

  validates :fullname,
            presence: true

  def self.by_rank
    User.all.sort_by(&:best_score).reverse
  end

  def best_game
    games.order('score DESC').first
  end

  def best_score
    best_game.score
  end
end
