Rails.application.routes.draw do


  namespace :go do
    resources :redirects
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  constraints(:subdomain => /go/) do
    namespace :go, path: '/' do
      root to: 'redirects#index'
      resources :redirects
      get '/*shortcut', to: 'redirects#redirect'
    end
  end

  root 'application#home'

  resources :sessions, only: [:new, :create]
  get 'auth/logout', to: 'sessions#destroy', as: :log_out
  match 'auth/:provider/callback' => 'sessions#create', via: [:post, :get]

  namespace :api do
    namespace :v1 do
      resources :users
      resources :people
    end
  end

  namespace :logbook do
    root 'users#dashboard'
    resources :users, only: [:show]
    resources :people
    resources :projects
    resources :tasks
    resources :one_on_ones
    resources :workshops
    resources :task_assignments do
      get 'toggle', on: :member
    end
    get 'manifest.appcache', to: 'application#manifest'
  end

  namespace :cic do
    root 'application#home'
    resources :stats
    resources :tasks
    resources :schools
    resources :workshops
    resources :people
    resources :projects
    resources :one_on_ones
    resources :task_assignments do
      get 'toggle', on: :member
    end
  end

  namespace :bluebook do
    root 'application#home'
    get '*anywhere', to: 'application#home'
  end

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
