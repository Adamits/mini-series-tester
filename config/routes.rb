Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :authors, only: [:index, :show]

  namespace :account do
    resource :settings, only: [:show] do
      member do
        post :make_reader
        post :make_writer
      end
    end
    resource :reader, only: [:show]
    resource :writer, only: [:show] do
      resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
        resources :compositions, controller: 'writer/projects/compositions', only: [:index, :show, :new, :create, :edit, :update]
      end
    end
  end

  resources :projects, only: [:index, :show] do
    resources :compositions, controller: 'projects/compositions', only: [:index, :show]
  end

  resources :compositions, only: [:index]

  root to: "home#index"
end
