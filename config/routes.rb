Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'application#home'
  resources :sessions, only: [:new, :create]

  resources :sessions, only: [:new, :create]
  get 'auth/logout', to: 'sessions#destroy', as: :log_out
  match 'auth/:provider/callback' => 'sessions#create', via: [:post, :get]
  get 'auth/failure' => 'sessions#failure'
  get '/data' => 'data#index'

  namespace :api do
    namespace :v1 do
      resources :users do
        get 'stats', on: :member
      end
      resources :people do
        member do
          get 'stats'
          get 'engagements_bubble_graph'
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
      resources :sites
      [:schools, :sites, :nationals].each do |endpoint|
        resources endpoint, only: [:index, :show] do
          member do
            get 'engagement_percentage_graph'
            get 'engagement_bubbles_graph'
            get 'people_projects_graph'
            get 'logged_hours_graph'
            get 'program_hours_graph'
            get 'engagement_counts_graph'
            get 'weekly_rhythm_graph'
            get 'engagements_context_graph'
            get 'engagements_per_week_graph'
            get 'projects_context_graph'
            get 'projects_scatter_graph'
            get 'projects_timeline_graph'
            get 'people_bubbles_graph'
            get 'people_context_graph'
            get 'people_timeline_graph'
            get 'hours_per_person_graph'
          end
        end
      end
    end
  end

  namespace :logbook do
    root 'stats#index'
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

  get '/logbookapp' => 'phonebook/application#home', as: 'logbook_app'
  namespace :phonebook do
    root 'application#home'
    get 'manifest.appcache', to: 'application#manifest'
    get '*anywhere', to: 'application#home'
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
