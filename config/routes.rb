Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :upload_image, to: 'editor_image_helper#upload_image'
    end
  end
  devise_for :admins
  root 'pages#index'
  resources :posts, only: [:index, :show]
  resources :works, only: [:index, :show]
  get 'about', to: 'pages#about'

  namespace :admins, path: 'yellow_mouse_3847' do 
    get '/', to: 'pages#index'
    resources :posts
    resources :works
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
