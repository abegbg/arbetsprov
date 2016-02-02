Rails.application.routes.draw do

	root "products#index"

	resources :products do
    resources :cartrows
  end

  resources :orders do 
	  resources :orderrows 
	end

  resources :cart

  get 'cartrows', to: 'cartrows#index'

end
