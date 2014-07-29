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

  private

  def valid_verification_token
    (user.username.length * 3 + score * 42) == verification_token
  end
end
