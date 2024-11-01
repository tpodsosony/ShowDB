class SeasonsController < ApplicationController
  def index
    page = params[:page].to_i || 1
    @per_page = 10  # Number of records per page
    offset = (page - 1) * @per_page
    @seasons = Season.limit(@per_page).offset(offset)
  end

  def show
    @season = Season.find(params[:id])
    @episodes = @season.episodes.all
  end
end
