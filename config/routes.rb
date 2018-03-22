Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'welcome/about', to: 'welcome#about'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
