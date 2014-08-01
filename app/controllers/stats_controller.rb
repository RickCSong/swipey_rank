class StatsController < ApplicationController
  respond_to :json

  def index
    stats = {}
    stats[:total_games_played] = Game.count
    stats[:total_number_players] = User.count
    stats[:median_score] = User.order('max_score').map(&:max_score)[User.count/2]
    stats[:average_game_score] = Game.sum(:score)/Game.count
    stats[:average_backflips] = Game.sum(:backflips)/Game.count

    stats[:total_time_spent_ms] = Game.sum(:duration)
    stats[:average_time_per_game_ms] = Game.sum(:duration)/Game.count

    days_played = Game.group("to_char(created_at, 'YYYY-MM-DD')").count.keys.length
    stats[:games_per_day] = Game.count / days_played.to_f
    stats[:games_per_hour] = Game.count / (days_played * 24).to_f
    stats[:games_per_minute] = Game.count / (days_played * 24 * 60).to_f

    stats[:rankings] = User.order('max_score').last(5)

    render json: stats
  end
end
