Bloccit32::Application.routes.draw do

  devise_for :users

  resources :topics do
  	resources :posts, except: [:index] do # I missed adding the do here
	    resources :comments, only: [:create, :destroy]
	  end
	end
#uninitialized error constant CommentsHelper


  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end