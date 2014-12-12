Bloccit::Application.routes.draw do
  resources :posts

  get 'about' => 'welcome#about'
  get 'learning' => 'welcome#learning'
  get 'news' => 'welcome#news'

  root to: 'welcome#index'
end