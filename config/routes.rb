Rapid::Application.routes.draw do
  controller :home do
    match '/(home)',    :to => :home,     :as => :home
  end

  root :to => "home#home"
end
