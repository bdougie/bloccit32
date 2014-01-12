Bloccit32::Application.routes.draw do

devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' , registrations: 'users/registrations' }

  resources :topics do
  	resources :posts, except: [:index] do # I missed adding the do here
	    resources :comments, only: [:create, :destroy]
	    match '/up-vote', to: 'votes#up_vote', as: :up_vote
      match '/down-vote', to: 'votes#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
	  end
	end
#uninitialized error constant CommentsHelper


  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end