class RankingSerializer < ActiveModel::Serializer
  attributes :user_name, :full_name, :max_score, :time_spent

  def user_name
    object.username
  end

  def full_name
    object.fullname
  end

  def max_score
    object.max_score
  end

  def time_spent
    object.time_spent
  end
end
