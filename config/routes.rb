Rails.application.routes.draw do
  root "projects#new"

  resources :projects
end
