class ActorsController < ApplicationController
  def new
    @actor = Actor.new
  end

  def index
    actors = Actor.all

    @actors = actors.order(last_name: :asc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html
    end
  end
  
  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end