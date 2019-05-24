Rails.application.routes.draw do
  resources :tasks, only: %i(index show create update destroy)
  resources :users, only: %i(create)
end
