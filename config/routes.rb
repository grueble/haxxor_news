HaxxorNews::Application.routes.draw do
  resources :articles, :only => [ :show, :new, :create, :index ] do
    resources :comments, :only => :create
    
    with_options :to => 'votes#create' do |routes|
      routes.post 'upvote', :sign => 1
      routes.post 'downvote', :sign => -1
    end
  end
  resources :comments, :only => :show do
    resources :comments, :only => :create
    
    with_options :to => 'votes#create' do |routes|
      routes.post 'upvote', :sign => 1
      routes.post 'downvote', :sign => -1
    end
  end
  resources :users, :only => [ :show, :new, :create ]
  resource :session, :only => [ :create ] do
    with_options :to => 'sessions#destroy' do |routes|
      routes.get 'logout'
    end
    with_options :to => 'sessions#new' do |routes|
      routes.get 'login'
    end
  end
    
  with_options :to => 'articles#index' do |routes|
    routes.get 'newest', :to => 'articles#index', :sort => 'newest'
    routes.get 'top-rated', :as => 'top_rated', :sort => 'rating'
    routes.get 'top-rated/:year', :as => 'top_rated_for_year', :sort => 'rating', 
      :constraints => {:year => /\d{4}/}
    routes.get 'top-rated/:year/:month', :as => 'top_rated_for_month', :sort => 'rating',
      :constraints => {:year => /\d{4}/, :month => /\d?\d/}
    routes.get 'top-rated/:year/:month/:day', :as => 'top_rated_for_day', :sort => 'rating',
      :constraints => {:year => /\d{4}/, :month => /\d?\d/, :day => /\d?\d/}
  end
  
  
  
  root :to => 'articles#index'
  
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
