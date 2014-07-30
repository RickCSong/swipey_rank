class User < ActiveRecord::Base
  has_many :games, dependent: :destroy

  validates :username,
            presence: true

  validates :fullname,
            presence: true
end
