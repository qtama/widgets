Rails.application.routes.draw do
  resources :widgets, only: %i[show index new create]
  resources :widget_ratings, only: [:create]

  # namespace :customer_service do
  #   resources :widgets, only: [:show, :update, :destroy]
  # end

  resources :design_system_docs, only: [:index] if Rails.env.development?

  # All API endpoints should go in this namespace.
  # If you need a custom route to an API endpoint,
  # add it in the custom routes section, but make
  # sure the resource-based route is here.
  namespace :api do
    namespace :v1 do
      resources :widgets, only: [:show]
    end
  end

  ####
  # Custom routes start here
  #
  # For each custom route:
  #
  # * Be sure you have the canonical route declared above
  # * Add new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything non-standard

  # Used in podcast ads for the 'amazing' campaign
  get '/amazing', to: redirect('/widgets')
  # Use this if it's important that no redirects happen
  # get '/amazing', to: 'widgets#index'
end
