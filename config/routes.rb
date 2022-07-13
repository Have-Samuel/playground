# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  get 'users' => 'users#index'
  get 'users/:id' => 'users#show', as: :user
  get 'users/:user_id/posts' => 'post#index', as: :user_posts
  get 'users/:user_id/posts/:id' => 'post#show', as: :user_post
end
