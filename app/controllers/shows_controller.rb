class ShowsController < ApplicationController
  def index
    @shows = Show.paginate(page: params[:page], per_page: 10)

    if params[:search_by_show] && params[:search_by_show] != ""
      @shows = @shows.where("title LIKE ?", "%#{params[:search_by_show]}%")
    end
  end

  def show
    @new_show = Show.find(params[:id])
    @show = @new_show.show_detail
    @seasons = @show.seasons.all
  end

end
