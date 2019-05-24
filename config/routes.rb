Rails.application.routes.draw do
  resources :sessions, only: %i(create)
  resources :tasks, only: %i(index show create update destroy)
  resources :users, only: %i(create)
end
