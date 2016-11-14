Blogger::Application.routes.draw do


  
  resources :favorites do 
    collection do
      get ':id/add_jv_fav_to_user'=> 'favorites#add_jv_fav_to_user', as: 'add_jv_fav_to_user'
    end
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'

  resources :matches


  resources :jeux_videos do
  	collection do
      resources :comments
      get ':id/add_jv_to_user' => 'jeux_videos#add_jv_to_user', as:'add_jv_to_user'
  	end
  end
  resources :home
  resources :tournois do 
  	collection do 
  		get ':id/list' => 'tournois#list', as:'list'
  		get 'add_user/:id' => 'tournois#add_user', as:'add_user'
      get 'play/:id' => 'tournois#play', as:'play'
  	end
  end

  

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauthcallbacks" }
  resources :users do
    collection do 
    	get 'jeux' => 'users#jeux', as:'jeux'
    	get 'tournois' => 'users#tournois', as:'tournois'
    	get 'statistiques' => 'users#statistiques', as:'statistiques'
      get 'player' => 'users#player', as: 'player'
      get 'tournament' => 'users#tournament', as: 'tournament'
    end
  end	
	get '/auth/facebook/callback' => 'session#authorize_callback'
 	get '/auth/facebook/setup' => 'session#setup'
 	
 	
end