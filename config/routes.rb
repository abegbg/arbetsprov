Rails.application.routes.draw do

	root "products#index"

	resources :products

  resources :carts do
    resources :cartrows
  end

  resources :orders do 
	  resources :orderrows 
	end

#  get 'confirmation' => 'orders#confirmation', as: 'confirmation'


#  patch 'orderrows/:id', to: 'orderrows#update_quantity', as: 'update_quantity'




  get 'cartrows', to: 'cartrows#index'

  resources :users

  resource :session

end
