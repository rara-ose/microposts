Rails.application.routes.draw do
  resources :users do
   member do
     get :followings, :followers
   end
 end
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  get    'edit', to: 'users#edit'
  get 'page/:page', :action => :index, :on => :collection
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :microposts
  resources :relationships, only: [:create, :destroy]
  
end