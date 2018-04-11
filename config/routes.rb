Rails.application.routes.draw do
  resources :projects 
  
  resources :tasks do 
	  collection do
      put :play_pause
  	end
  end

  root 'tasks#index'
end
