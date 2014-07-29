class GamesController < ApplicationController
  respond_to :json

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.json { render :show, status: :created, location: @game }
      else
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:user_id, :score, :duration)
    end
end
