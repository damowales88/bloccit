Bloccit::Application.routes.draw do
  get "welcome/learning"
  get "welcome/index"
  get "welcome/about"

  root to: 'welcome#index'
end