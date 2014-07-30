class RankingSerializer < ActiveModel::Serializer
  attributes :user_name, :full_name, :max_score, :max_backflips, :time_spent

  def user_name
    object.username
  end

  def full_name
    object.fullname
  end

  def time_spent
    object.time_spent / 1000
  end
end
