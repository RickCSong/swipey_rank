class RankingsController < ApplicationController
  respond_to :json

  def index
    respond_with User.all.includes(:games),
                 each_serializer: RankingSerializer
  end
end
