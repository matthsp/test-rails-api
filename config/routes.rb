Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pokemons
    end

    # I could inject a version 2 here once some big changes are requested - obviously here I wont need it
  end
end
