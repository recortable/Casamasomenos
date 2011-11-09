Cmom::Application.routes.draw do
  root :to => "public/articles#index"

  scope module: 'public' do
    resources :articles, :path => 'articulos', :except => :index do
      resources :comments, :path => 'comentarios'
    end

    match "/salir" => "sessions#destroy", :as => :logout
    match "/sesion" => "sessions#create", :as => :create_session
    match "/entrar" => "sessions#new", :as => :login
    match "/enter/:id" => "sessions#enter", :as => :enter
    resources :sessions
  end


  namespace :admin do
    root to: 'navigations#show'
    resources :articles, path: 'articulos' do
      collection { post :sort }
      resources :relations, path: 'relaciones'
      resources :mediafiles, path: 'ficheros'
      resources :translations, path: 'traducciones'
    end
    resource :navigation, path: 'navegacion'
    resources :users, path: 'participantes'
    resources :categories, path: 'categorias'
    resources :relations, path: 'relaciones'
    resources :mediafiles, :path => 'ficheros'
  end
end
