class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # POST /games
  # POST /games.json
  def create
    swipey_value = user_params[:username].length * 3 + Integer(game_params[:score]) * 42

    @user = User.find_or_create_by(user_params)
    @game = Game.new(game_params.merge(user_id: @user.id))

    respond_to do |format|
      if @game.save && Integer(params[:swipey]).to_i == swipey_value
        format.json { render :show, status: :created, location: @game }
      else
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
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
