Cmom::Application.routes.draw do
  root :to => redirect('/articulos/1')
  match '/admin' => redirect("/admin/articulos")

  match "/salir" => "sessions#destroy", :as => :logout
  match "/sesion" => "sessions#create", :as => :create_session
  match "/entrar" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter


  resources :articles, :path => 'articulos' do
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

  resources :navigations, :path => ''
end
