Terminal::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  resources :users do
    #match 'user/find' => 'users#find', :on => :member

    get 'search', :on => :collection
    get 'find', :on => :collection
    get 'info', :on => :collection
    get 'show_info', :on => :collection

    resources :programs do
      get 'task', :on => :member
      get 'info', :on => :member
      get 'begin_program', :on => :member
      get 'user_info', :on => :member
    end

    resources :tasks do
      get 'answer', :on => :member
      get 'reshow', :on => :member
      get 'task_again', :on => :member
      get 'task_recap', :on => :member
    end
  end

  resources :programs do
    get 'info', :on => :member

    resources :tasks do

    end
  end



  namespace :admin do

    root :to => 'dashboard#index'
    resources :dashboard
    resources :users
    resources :tasks
    resources :programs do
      resources :tasks
    end
  end



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
  root :to => 'dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
