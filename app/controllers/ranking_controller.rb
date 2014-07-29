class RankingController < ApplicationController
  def index
    @games = Game.all
  end
end
