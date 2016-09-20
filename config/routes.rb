Blogger::Application.routes.draw do

  
  resources :matches
	root to: 'home#index'

  resources :jeux_videos
  resources :home
  resources :tournois do 
  	collection do 
  	get ':id/list' => 'tournois#list', as:'list'
  end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauthcallbacks" }
  resources :users

	get '/auth/facebook/callback' => 'session#authorize_callback'
 	get '/auth/facebook/setup' => 'session#setup'
 	
 	
end