class MoviesController < ApplicationController
  def index
    @movies = params[:search] ? Movie.where("name LIKE ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 4) : Movie.paginate(page: params[:page], per_page: 4)

    if params[:start_date] && params[:end_date]
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @movies = @movies.where(release_date: start_date..end_date)
    end
  end

  def show
    redirect_to root_path
  end
end
