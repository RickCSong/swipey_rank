class GamesController < ApplicationController
  respond_to :html, :json

  # POST /games
  # POST /games.json
  def create
    swipey_value = user_params[:username].length * 3 + Integer(game_params[:score]) * 42
    if Integer(params[:swipey]) != swipey_value
       return
    end

    @user = User.find_or_create_by(user_params)
    @game = Game.new(game_params)
    @game.user = @user
    @game.save

    respond_with @game
  end

  private
    def user_params
      params.require(:user).permit(:username, :fullname)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:score, :duration)
    end
end
