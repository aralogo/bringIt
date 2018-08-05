Rails.application.routes.draw do
  resources :delivery_orders
  resources :contract_origins
  resources :matches
  resources :journeys do
    resources :locations
  end
  resources :packages
  resources :bank_accounts
  resources :vehicles
  resources :reviews
  #devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :location_logs
  resources :categories
  
  post 'search' => 'journeys#search'
  get 'journeydetails/:id' => 'journeys#showDetails' , :as => :journey_details
  get 'newMatchfromJourney' => 'matches#newMatchfromJourney', :as => :matchJourney
  get 'payMatch/:id' => 'matches#payMatch', :as => :payMatch
  
  get 'indexUser' => 'matches#indexUser', :as => :indexUserMatch
  get 'indexUserOrigin' => 'contract_origins#indexUser', :as => :indexUserContract
  get 'indexUserDelivery' => 'delivery_orders#indexUser', :as => :indexUserDelivery
 
  #not used 
  get 'vehicleOwn' => 'vehicles#indexOwn', :as => :vehiclesUser
  
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'
  get '/home' => 'site#home'
  get '/thanks/:id' => 'site#thanks'
    
  root :to => "site#home"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
