Cmom::Application.routes.draw do
  root :to => 'maps#show'
  match '/admin' => redirect("/admin/articulos")

  match "/cerrar" => "sessions#destroy", :as => :logout
  #match "/identificarse" => "sessions#new", :as => :login
  match "/enter/:id" => "sessions#enter", :as => :enter


  resources :articles, :path => 'articulos' do
    resources :comments, :path => 'comentarios'
  end
  resources :comments, :path => 'respuestas'

  scope "/admin" do
    resources :users, :path => 'participantes'
#    resources :datamaps, :path => 'mapas'
#    resources :assets, :path => 'archivos'
  end

end
