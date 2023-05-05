Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pokemons
    end

    # I could inject a version 2 here once some big changes are requested - obviously here I wont need it
  end

  # Catch-all route for invalid routes
  match '*path', to: 'application#not_found', via: :all
end
