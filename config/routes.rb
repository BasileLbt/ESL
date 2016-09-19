Blogger::Application.routes.draw do

  
  resources :matches
	root to: 'home#index'

  resources :jeux_videos
  resources :home
  resources :tournois

	devise_for :users, :controllers => { :omniauth_callbacks => "omniauthcallbacks" }
	resources :users

	get '/auth/facebook/callback' => 'session#authorize_callback'
 	get '/auth/facebook/setup' => 'session#setup'
 	get 'tournois/list' => 'tournois#list'
 	
end