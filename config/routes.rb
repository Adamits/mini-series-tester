Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :authors, only: [:index, :show]

  namespace :account do
    resource :settings, only: [:show]
    resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
      resources :compositions, controller: 'projects/compositions', only: [:index, :show, :new, :create, :edit, :update]
    end
  end

  resources :projects, only: [:index, :show] do
    resources :compositions, controller: 'projects/compositions', only: [:index, :show]
  end

  resources :compositions, only: [:index]

  root to: "home#index"
end
