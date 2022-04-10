class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    matching_movies = Movie.all

    @movies = matching_movies.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: 'Movie created successfully.'
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
  end

  def update
    @movie = Movie.find(params.fetch(:id))
    @movie.update movie_params

    if @movie.valid?
      @movie.save
      redirect_to movie_url(@movie), notice: 'Movie updated successfully.'
    else
      redirect_to movie_url(@movie), alert: 'Movie failed to update successfully.'
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))
    @movie.destroy

    redirect_to movies_url, notice: 'Movie deleted successfully.'
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
