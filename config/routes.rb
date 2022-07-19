Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new]
    post 'posts/:id/comments' => 'posts#create_comment', as: :create_comment
    post 'post/:id/likes' => 'posts#create_like', as: :create_like
  end
end
