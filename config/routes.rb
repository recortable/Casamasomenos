Cmom::Application.routes.draw do
  root :to => "articles#index"

  match "/salir" => "sessions#destroy", :as => :logout
  match "/sesion" => "sessions#create", :as => :create_session
  match "/entrar" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter

  match "/mapa/:id" => "diagrams#show", :as => :diagram
  match "/articulos" => "articles#index", :as => :index

  resources :articles, :path => 'articulo', :except => :index do
    resources :comments, :path => 'comentarios'
    resources :relations, :path => 'relaciones'
  end
  resources :comments, :path => 'respuestas'
  resources :relations, :path => 'relaciones'
  resources :mediafiles, :path => 'ficheros'
  resources :users, path: 'participantes'


  namespace :admin do
    root to: 'navigations#show'
    resources :articles, path: 'entradas' do
      collection { post :sort }
      resources :relations, path: 'relaciones'
      resources :mediafiles, :path => 'ficheros'
    end
    resource :navigation, path: 'navegacion'
    resources :users, path: 'participantes'
    resources :categories, path: 'categorias'
    resources :relations, path: 'relaciones'
    resources :mediafiles, :path => 'ficheros'
  end
end
