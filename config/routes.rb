Rails.application.routes.draw do
  root 'movies#index'

  # Routes for the Movie resource:
  resources :movies
  # CREATE
  # post '/movies' => 'movies#create', as: :movies # movies_url and movies_path
  # get 'movies/new' => 'movies#new', as: :new_movie # new_movie_url and new_movie_path

  # # READ
  # get '/movies' => 'movies#index'
  # get '/movies/:id' => 'movies#show', as: :movie # movie_path() -> expects argmument to populate :id

  # # UPDATE
  # patch '/movies/:id' => 'movies#update'
  # get '/movies/:id/edit' => 'movies#edit', as: :edit_movie # edit_movie_path()

  # # DELETE
  # delete '/movies/:id' => 'movies#destroy'

  #------------------------------

  # Routes for the Actor resource:
  resources :actors
end