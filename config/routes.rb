Cmom::Application.routes.draw do
  root :to => redirect('/articulos/1')
  match '/admin' => redirect("/admin/articulos")

  match "/cerrar" => "sessions#destroy", :as => :logout
  #match "/identificarse" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter


  resources :articles, :path => 'articulos' do
    resources :comments, :path => 'comentarios'
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
