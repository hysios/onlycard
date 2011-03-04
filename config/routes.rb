ActionController::Routing::Routes.draw do |map|
  map.resources :customers
  map.resource :user_session
  map.resource :account , :controller => "users"
  map.resources :users  
  map.resources :casts
  map.root :controller => "user_sessions" , :action => "new"
  map.connect 'logout', :controller => "user_sessions" , :action => "destroy" 
  map.connect 'cast' , :controller => "casts", :action => "new"

end
