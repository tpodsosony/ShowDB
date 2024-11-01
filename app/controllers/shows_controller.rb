class ShowsController < ApplicationController
  def index
    @shows = Show.paginate(page: params[:page], per_page: 10)
  end

  def show
    @new_show = Show.find(params[:id])
    @show = @new_show.show_detail
    @seasons = @show.seasons.all
  end
end
