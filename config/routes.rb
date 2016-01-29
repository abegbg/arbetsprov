Rails.application.routes.draw do

	root "products#index"

  get "products" => "products#index"
  get "products/:id" => "products#show", as: "product"



end
