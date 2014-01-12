Bloccit32::Application.routes.draw do

  get "posts/index"

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' , registrations: 'users/registrations' }

resources :users, only: [:show]

  resources :users, only: [:show, :index]
  resources :posts, only: [:index]
  
  resources :topics do
  	resources :posts, except: [:index] , controller: 'topics/posts' do # I missed adding the do here
	    resources :comments, only: [:create, :destroy]
	    match '/up-vote', to: 'votes#up_vote', as: :up_vote
      match '/down-vote', to: 'votes#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
    end
	end



  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end