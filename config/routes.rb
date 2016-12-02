Rails.application.routes.draw do
  devise_for :users, only: []

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resource :login, only: [:create], controller: :sessions
      resources :users, only: %i(create show)
    end
  end  
end
