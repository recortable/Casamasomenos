Cmom::Application.routes.draw do
  root :to => 'articles#index'
  match '/admin' => redirect("/admin/articulos")

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
