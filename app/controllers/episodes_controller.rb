class EpisodesController < ApplicationController
  def index
    @episodes = Episode.paginate(page: params[:page], per_page: 10)
  end

  def show 
    @episode = Episode.find(params[:id])
  end
end
