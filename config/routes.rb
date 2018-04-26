Rails.application.routes.draw do
  resources :projects 
  
  resources :tasks do 
	collection do
      put :play_pause
  	  get :reload	
  	end
  end

  root 'tasks#index'
end
