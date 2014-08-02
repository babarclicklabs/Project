Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :articles
  amespace :admin do 
  get '', to: 'dashboard#index', as: '/' 
  resource :dashboard do
    post :edit_multiple
    put :update_multiple
  end
end
  root :to => 'articles#index'
 
end
