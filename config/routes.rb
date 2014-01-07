Bloccit32::Application.routes.draw do

  devise_for :users

  resources :topics do
  	resources :posts, except: [:index]
    resources :comments, only: [:index]
  end

#uninitialized error constant CommentsHelper


  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end