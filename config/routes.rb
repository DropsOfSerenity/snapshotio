Rails.application.routes.draw do
  root "projects#new"

  resources :projects, only: [:new, :create, :show, :index]
end
