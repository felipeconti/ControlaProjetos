ControlaProjetos::Application.routes.draw do

  mount RailsAdmin::Engine => '/_admin', :as => 'rails_admin'

  resources :types
  resources :states
  resources :items
  resources :meeting_items

  resources :meetings do
    resources :meeting_items
  end

  resources :customers do
    resources :projects do
      resources :tasks do
        resources :items
      end
    end
  end

  devise_for :users do
    match '/users/sign_up' => 'devise/sessions#new'
  end

  resources :users, :controller => 'users_json'

  resources :user_items, :controller => 'items', :action => 'index'

  resources :user_meeting_items, :controller => 'meeting_items', :action => 'index'

  match '/customers/detail/:id' => 'customers#detail', :as => 'customer_detail'
  match '/customers/:customer_id/projects/:id/detail' => 'projects#detail', :as => 'customer_project_detail'
  match '/customers/:customer_id/projects/:project_id/tasks/:id/detail' => 'tasks#detail', :as => 'customer_project_task_detail'
  match '/meetings/detail/:id' => 'meetings#detail', :as => 'meeting_detail'

  get 'user_items_result', to: 'items#result'
  get 'user_meeting_items_result', to: 'meeting_items#result'

  root :to => "items#index"

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
