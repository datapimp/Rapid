Rapid::Application.routes.draw do
  devise_for :users

  resources :users

  controller :home do
    match '/(home)',    :to => :home,     :as => :home
  end

  root :to => "home#home"
end
