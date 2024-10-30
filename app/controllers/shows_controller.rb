class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    @new_show = Show.find(params[:id])
    @show = @new_show.show_detail
  end
end
