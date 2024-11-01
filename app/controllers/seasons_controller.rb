class SeasonsController < ApplicationController
  def index

    @seasons = Season.paginate(page: params[:page], per_page: 10)
  end

  def show
    @season = Season.find(params[:id])
    @episodes = @season.episodes.all
  end
end
