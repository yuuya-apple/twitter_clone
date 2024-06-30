# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  root to: 'tweets#index'

  resources :tweets
  resources :favorites, only: %i[create]
  resources :retweets, only: %i[create]
  resources :follows, only: %i[create]
  resources :book_marks, only: %i[create index]

  get '/logout', to: 'tweets#index'
  post '/tweets/:tweet_id/comments', to: 'comments#create'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
