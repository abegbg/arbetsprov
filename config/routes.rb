Rails.application.routes.draw do

  resources :users

	root "products#index"

	resources :products do
    resources :cartrows
  end

  resources :orders do 
	  resources :orderrows 
	end

  resources :carts

  get 'cartrows', to: 'cartrows#index'

end
