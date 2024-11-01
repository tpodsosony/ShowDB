class ShowsController < ApplicationController
  def index
    page = params[:page].to_i || 1
    @per_page = 10  # Number of records per page
    offset = (page - 1) * @per_page
    @shows = Show.limit(@per_page).offset(offset)
  end

  def show
    @new_show = Show.find(params[:id])
    @show = @new_show.show_detail
    @seasons = @show.seasons.all
  end
end
