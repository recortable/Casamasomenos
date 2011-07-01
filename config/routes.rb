Cmom::Application.routes.draw do
#  root :to => "articles#welcome"
  root :to => "pages#index"

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

  scope "/admin" do
    resources :users, :path => 'participantes'
#    resources :datamaps, :path => 'mapas'
#    resources :assets, :path => 'archivos'
  end

end
