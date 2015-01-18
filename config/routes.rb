Bloccit::Application.routes.draw do
  devise_for  :users
  resources :users, only: [:update]
  
  resources :topics do
    resources :posts, except: [:index] do
        resources :comments, only: [:create, :destroy]
    end
  end

  get 'about' => 'welcome#about'
  get 'learning' => 'welcome#learning'
  get 'news' => 'welcome#news'
  get 'subscribed_users/new' => 'subscribed_users#new'
  post 'subscribed_users' => 'subscribed_users#create'

  root to: 'welcome#index'
end