Rails.application.routes.draw do


  namespace :go do
    resources :redirects
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  constraints(:subdomain => /go/) do
    namespace :go, path: '/' do
      root to: 'redirects#index'
      resources :redirects
      get '/*shortcut', to: 'redirects#redirect'
    end
  end

  root 'application#home'

  resources :sessions, only: [:new, :create] do
    get 'students', on: :collection
  end
  resources :people
  resources :reflections
  resources :projects
  get '/activity', to: 'actions#index', as: :activity
  resources :identities do
    get 'register', on: :member
  end

  resources :sessions, only: [:new, :create]
  get 'auth/logout', to: 'sessions#destroy', as: :log_out
  get '/me', to: 'people#me', as: :me
  get '/os', to: 'application#os', as: :os
  post '/register', to: 'people#register', as: :register
  match 'auth/:provider/callback' => 'sessions#create', via: [:post, :get]
  get 'auth/failure' => 'sessions#failure'
  get '/data' => 'data#index'

  namespace :api do
    namespace :v1 do
      resources :users do
        get 'stats', on: :member
      end
      resources :people do
        get 'stats', on: :member
      end
      resources :schools do
        member do
          get 'context_graph'
          get 'engagement_percentage_graph'
          get 'people_projects_graph'
          get 'logged_hours_graph'
          get 'program_hours_graph'
          get 'engagement_counts_graph'
          get 'weekly_rhythm_graph'
          get 'engagements_context_graph'
          get 'projects_context_graph'
        end
      end
      resources :projects do
        get 'stats', on: :member
      end
      resources :engagements do
        get 'upload', on: :member
        get 'attendees', on: :member
      end
      resources :engagement_attendees
      resources :one_on_ones
      resources :reports
      resources :reflections
      resources :testimonials
      resources :assets, only: [:create, :destroy]
      resources :search_results, only: [:index]
      resources :sites do
        resources :people
      end
      resources :stats, only: [:index]
      resources :graphs do
        collection do
          get 'school_context'
        end
      end

    end
  end

  namespace :logbook do
    root 'stats#index'
    resources :actions, only: [:index, :show] do
      get :from, on: :collection
    end
    resources :people
    resources :notes
    resources :projects do
      get 'toggle_dream_team', on: :member
    end
    resources :engagements do
      get 'duplicate', on: :member
      get 'toggle_dream_team', on: :member
    end
    resources :assets, only: [:show, :index, :destroy]
    resources :schools, only: [:index, :show]
    resources :sites, only: [:index, :show]
    resources :engagement_attendees, only: [:show]
  end

  namespace :citybook do
    root 'actions#index'
    resources :sites
    resources :people do
      resources :reflections
    end
    resources :projects
    resources :engagements do
      get 'attendance', on: :member
    end
    resources :actions, only: [:index, :show] do
      get :from, on: :collection
    end
  end

  get '/logbookapp' => 'phonebook/application#home', as: 'logbook_app'
  namespace :phonebook do
    root 'application#home'
    get 'manifest.appcache', to: 'application#manifest'
    get '*anywhere', to: 'application#home'
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
