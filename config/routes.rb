# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  # Dynamic error pages
  get '/404', to: 'errors#not_found', via: :all
  get '/422', to: 'errors#unacceptable', via: :all
  get '/500', to: 'errors#internal_error', via: :all

  resources :home, only: %i[index show], path: '/' do
    collection do
      get :cherry_show_page
    end
  end
  get '/animal/:id/diet', to: 'home#animal_diet', as: 'animal_diet_api'
  get '/animal/:id/life', to: 'home#animal_life', as: 'animal_life_api'

end
