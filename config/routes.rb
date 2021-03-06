Rails.application.routes.draw do
  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'application#home'

  resources :sessions, only: [:new, :create]
  get 'auth/logout', to: 'sessions#destroy', as: :log_out
  match 'auth/:provider/callback' => 'sessions#create', via: [:post, :get]
  get 'auth/failure' => 'sessions#failure'
  get "identities/register", to: "identities#register", as: :register
  resources :identities, only: [:update]
  namespace :my do
    match "/profile", to: "application#update", via: [:post, :patch, :put], as: :profile
    get "/location", to: "application#location", as: :location
    get "/landing", to: "application#landing", as: :landing
    get ":action", controller: "application"
  end
  resources :notes, only: [:index, :show]

  namespace :api do
    namespace :v2 do
      resources :users, only: [:index, :show, :update]
      resources :people do
        get 'leaderboard', on: :collection
        get 'lapsed', on: :collection
      end
      resources :projects do
        get 'leaderboard', on: :collection
      end
      resources :engagements do
        get 'leaderboard', on: :collection
      end
      resources :engagement_attendees
      resources :report_submissions do
        get 'submitted', on: :collection
      end
      get '/assets/signed_s3_path' => 'assets#signed_s3_path'
      resources :assets
      resources :search_results, only: [:index]
      resources :notes
      resources :hashtags, only: [:index, :show]
      [:schools, :sites, :nationals].each do |endpoint|
        resources endpoint, only: [:index, :show] do
          collection do
            get 'stats'
          end
        end
      end
      get '/:scope_type/:scope_id/graphs/:action', controller: 'graphs'
    end

    namespace :v3 do
      resources :people do
        collection do
          get "sync"
          get "search"
          get "lapsed"
        end
      end
      resources :engagements
      namespace :me do
        root to: "base#profile"
      end
      get '/assets/signed_s3_path' => 'assets#signed_s3_path'
    end

  end# end api namespace

  namespace :logbook do
    root 'application#dashboard'
    get 'set_scope', to: 'application#set_scope'
    get 'clear_scope', to: 'application#clear_scope'
    get '/*whatever', to: 'application#dashboard'
    resources :engagements, only: [:index, :show]
    resources :projects, only: [:index, :show]
    resources :notes, only: [:index, :show]
    resources :people, only: [:index, :show]
  end

  get '/mobile' => 'phonebook/application#app'
  namespace :phonebook do
    root 'application#app'
    get 'manifest.appcache', to: 'application#manifest'
    get 'auth', to: "application#auth"
    get '*anywhere', to: 'application#app'
  end
  namespace :webapp do
    resources :people
    resources :schools do
      resources :people
    end
    resources :sites do
      resources :people
    end
  end


  #
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
