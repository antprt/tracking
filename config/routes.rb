Rails.application.routes.draw do
  get 'pixels/create'

  get 'pixels/update'

  resources :providers
  root :to => 'welcome#index'
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'sign_in',
               sign_out: 'sign_out',
             },
             controllers: {
               sessions: 'sessions',
             }

  post '/pixel/', to: 'pixels#create', as: 'pixel_create'
  post '/pixel/:name', to: 'pixels#update', as: 'pixel_update'
end