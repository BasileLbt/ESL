Blogger::Application.routes.draw do

  
  resources :matches
	root to: 'home#index'

  resources :jeux_videos do
  	collection do
  		get 'add_jv_to_users'
  	end
  end
  resources :home
  resources :tournois do 
  	collection do 
    resources :users  
  	get ':id/list' => 'tournois#list', as:'list'
  end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauthcallbacks" }

	get '/auth/facebook/callback' => 'session#authorize_callback'
 	get '/auth/facebook/setup' => 'session#setup'
 	
 	
end