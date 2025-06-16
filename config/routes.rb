Rails.application.routes.draw do
  get "comments/new"
  get "comments/create"
  get "memos/new"
  get "memos/create"
  get "memos/edit"
  get "memos/update"
  get "memos/destroy"
  get "home/index"
  get "children/dashboard"
  get "parents/dashboard"
  devise_for :parents, controllers: {
    sessions: "parents/sessions",
    registrations: "parents/registrations"
  }
  devise_for :children, controllers: {
    sessions: "children/sessions",
    registrations: "children/registrations"
  }

  namespace :children do
    resource :session, only: [ :new, :create, :destroy ]
  end

  resources :parents, only: [ :show, :edit, :update ] do
    resources :children, only: [ :new, :create, :edit, :update ]
  end

  resources :children, only: [ :show, :edit, :update ] do
    resources :memos, only: [ :index, :new, :create, :edit, :update, :destroy ] do
      resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
      member do
        delete :delete_image
      end
    end
  end

  resources :memos, only: [] do
    resources :comments, only: [ :new, :create, :edit, :update, :destroy ]
  end

  get "parent/dashboard", to: "parents#dashboard", as: :parent_dashboard
  get "child/dashboard", to: "children#dashboard", as: :child_dashboard

  root to: "home#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  devise_scope :parent do
    get "parents/sign_out", to: "parents/sessions#destroy"
  end
end
