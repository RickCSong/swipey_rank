class Game < ActiveRecord::Base
  belongs_to :user

  validates :user_id,
            presence: true

  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :duration,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :verification_token,
            presence: true

  validate :valid_verification_token

  after_commit :update_user_counters, on: :create

  private

  def valid_verification_token
    if (user.username.length * 3 + score * 42) != verification_token
      errors.add(:verification_token, 'invalid verification token')
    end
  end

  def update_user_counters
    user.max_score = [user.max_score, score].max
    user.max_backflips = [user.max_backflips, backflips].max
    user.time_spent = user.time_spent + duration
    user.save
  end
end
