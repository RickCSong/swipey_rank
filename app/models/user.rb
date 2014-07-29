class User < ActiveRecord::Base
  has_many :games

  validates :username,
            presence: true

  validates :fullname,
            presence: true
end
