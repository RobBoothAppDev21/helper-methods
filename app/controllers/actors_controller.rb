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
    @actor = Actor.find(params.fetch(:id))
  end

  def create
    @actor = Actor.new(actor_params)

    if @actor.valid?
      @actor.save
      redirect_to actors_url, notice: 'Actor saved successfully'
    else
      render 'new'
    end
  end

  def edit
    @actor = Actor.find(params.fetch(:id))
  end

  def update
    @actor = Actor.find(params.fetch(:id))
    @actor.update actor_params

    if @actor.valid?
      @actor.save
      redirect_to actor_url(@actor), notice: 'Actor updated successfully.'
    else
      redirect_to actor_url(@actor), alert: 'Actor failed to update successfully.'
    end
  end

  def destroy
    @actor = Actor.find(params.fetch(:id))
    @actor.destroy

    redirect_to actors_url, notice: 'Actor deleted successfully'
  end

  private

  def actor_params
    params.require(:actor).permit(:first_name, :last_name)
  end
end