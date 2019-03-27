Rails.application.routes.draw do

  get 'static_page/home'
  root 'static_page#home'
  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'

  resources :tasks, only: [:index, :create, :destroy, :edit, :update]

  resources :lists, only: [:index, :create, :destroy, :edit, :update] do
    resources :tasks, only: [:new, :show]
  end 

  resources :users, only: [:index, :create, :destroy, :edit, :update, :show] do
    resources :lists, only: [:new, :show]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
