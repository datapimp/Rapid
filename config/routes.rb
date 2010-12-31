Rapid::Application.routes.draw do
  resources :items

  devise_for :users

  resources :users, :only => [:index,:edit,:update]

  namespace :admin do
    match "/admin/(home)", :to => "home#home"
    resources :users
  end

  controller :home do
    match '/(home)',    :to => :home,     :as => :home
  end

  root :to => "home#home"
end
