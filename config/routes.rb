Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :upload_image, to: 'editor_image_helper#upload_image'
    end
  end
  devise_for :admins, path: 'yellow_mouse_3847', controllers: { sessions: "admins/devise/sessions", registrations: "admins/devise/registrations" }
  root 'pages#index'
  resources :posts, only: [:index, :show]
  resources :works, only: [:index, :show]
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  post 'contact', to: 'pages#contact_create'

  namespace :admins, path: 'yellow_mouse_3847' do
    get '/', to: 'pages#index'
    resources :posts
    resources :works
    resources :page_blocks
    resources :contacts
    resources :banners
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
