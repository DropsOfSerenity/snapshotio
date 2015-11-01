Rails.application.routes.draw do
  root "projects#new"

  devise_for :users
  resources :projects do
    resources :shots, only: [:new, :create, :index, :show, :destroy]
  end

end
