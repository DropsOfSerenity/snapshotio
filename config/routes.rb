Rails.application.routes.draw do
  root 'projects#index'

  devise_for :users
  resources :projects, only: [:index, :show, :edit, :update] do
    resources :shots, only: [:new, :create, :index, :show, :destroy]
  end

  namespace :admin do
    root 'application#index'

    resources :projects, only: [:new, :create, :destroy]
    resources :users do
      member do
        patch :archive
      end
    end
  end

end
