class RankingController < ApplicationController
  def index
    @rankings = User.by_rank
  end
end
