Bloccit::Application.routes.draw do
  resources :posts

  get 'about' => 'welcome#about'
  get 'learning' => 'welcome#learning'
  get 'news' => 'welcome#news'
  get 'subscribed_users/new' => 'subscribed_users#new'
  post 'subscribed_users' => 'subscribed_users#create'

  root to: 'welcome#index'
end