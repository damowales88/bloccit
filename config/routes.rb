Bloccit::Application.routes.draw do
  get "welcome/news"
  get "welcome/learning"
  get "welcome/index"
  get "welcome/about"

  root to: 'welcome#index'
end