  Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    resources :users, only: :create
    resources :sessions, only: :create
    post '/registration_complete', to: 'users#registration_complete'
    resources :projects
    resources :tasks, only: [:create, :destroy, :show]
    resource :tasks, only: [:update]
    resources :stages
  end
end
