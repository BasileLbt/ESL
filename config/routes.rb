Blogger::Application.routes.draw do

  
  resources :matches
	root to: 'home#index'

  resources :jeux_videos do
  	collection do
  		get ':id/add_jv_to_user' => 'jeux_videos#add_jv_to_user', as:'add_jv_to_user'
  	end
  end
  resources :home
  resources :tournois do 
  	collection do 
  	get ':id/list' => 'tournois#list', as:'list'
  end
  end

  resources :users do
    collection do 
    	get 'jeux' => 'users#jeux', as:'jeux'
    	get 'tournois' => 'users#tournois', as:'tournois'
    	get 'statistiques' => 'users#statistiques', as:'statistiques'
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauthcallbacks" }

	get '/auth/facebook/callback' => 'session#authorize_callback'
 	get '/auth/facebook/setup' => 'session#setup'
 	
 	
end