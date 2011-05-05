Cmom::Application.routes.draw do

  match '/admin' => redirect("/admin/articulos")

  scope "/admin" do
    resources :articles, :path => 'articulos'
#    resources :datamaps, :path => 'mapas'
#    resources :assets, :path => 'archivos'
  end

end
