Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :destroy]
    resources :comments, only: [:destroy]
    post 'posts/:id/comments' => 'posts#create_comment', as: :create_comment
    post 'post/:id/likes' => 'posts#create_like', as: :create_like
  end
end
