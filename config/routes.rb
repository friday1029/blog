Rails.application.routes.draw do
  resources :posts, only: [:index, :show]
  resources :works, only: [:index, :show]
  get 'about', to: 'pages#about'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
