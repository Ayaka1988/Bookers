Rails.application.routes.draw do
  root to: 'homes#top'
  # get '/' => 'homes#top'
  # get 'books/new'
  # post 'books' => 'books#create'
  # get '/index' => 'books#index'
  # get '/show' => 'books#show'
  # get '/edit' => 'books#edit'

  resources :books


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
