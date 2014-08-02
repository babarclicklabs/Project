Rails.application.routes.draw do
  #get 'facebook/new'

#resource :comments
#resource :posts
#root to: 'posts#index'
devise_for :users,:controllers=>{:registrations=>"registrations"} 
#post 'users/sign_up'=>'registrations#create'                                                                                                                                                                                                                           
root :to => 'home#index' 
 get '/register/facebook/' =>'facebook#new', :as => :fb_registration
 post 'facebook/registrations'=> 'facebook#create', :as=>:register_with_fb
  end