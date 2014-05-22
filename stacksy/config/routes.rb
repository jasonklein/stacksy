Stacksy::Application.routes.draw do

  get "tracks/tracker_index"

  get "tracks/tracked_index"

devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

resources :users do
  # collection {post :search, to: 'users#search'}
end

resources :users do
  resources :blocks
  resources :favorites
  resources :messages
  resources :pings
  resources :profiles
end

get '/users/:id/search', to: 'users#search', as: 'user_search'
get '/users/:id/home', to: 'users#home', as: 'user_home'
get '/users/:id/sign_up_1', to: 'users#gender_zipcode', as: 'user_gender_zipcode_sign_up'
get '/users/:id/sign_up_2', to: 'users#gender_interests', as: 'user_gender_interests_sign_up'
get '/users/:id/membership', to: 'users#membership', as: 'user_membership'
get '/users/:id/profile', to: 'profiles#show', as: 'profile'
post '/users/messages/:recipient_id', to: 'messages#create', as: 'create_message'
post '/users/:pinged_id/pings', to: 'pings#create', as: 'create_ping'
get '/users/:id/tracker_index', to: 'tracks#tracker_index', as: 'tracker_index'
get '/users/:id/tracked_index', to: 'tracks#tracked_index', as: 'tracked_index'

devise_scope :user do
  root :to => "devise/sessions#new"
end



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
