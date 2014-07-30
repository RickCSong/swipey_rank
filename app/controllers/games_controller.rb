class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  respond_to :json

  def show
    @game = Game.find(params[:id])
  end

  # POST /games.json
  def create
    @user = User.find_or_create_by(user_params)
    @game = Game.create(game_params.merge(user_id: @user.id))

    # TODO: Fix this.
    render plain: "OK"
  end

  private
    def user_params
      params.require(:user).permit(:username, :fullname)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:score, :duration, :backflips, :verification_token)
    end
end
