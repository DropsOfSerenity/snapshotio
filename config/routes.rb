Rails.application.routes.draw do
  root "projects#new"

  resources :projects do
    resources :shots, only: [:new, :create, :index, :show]
  end
end
