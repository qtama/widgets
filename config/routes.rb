Rails.application.routes.draw do
  resources :widgets, only: [:show, :index]
  resources :widget_ratings, only: [:create]

  namespace :customer_service do
    resources :widgets, only: [:show, :update, :destroy]
  end

  if Rails.env.development?
    resources :design_system_docs, only: [:index]
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
