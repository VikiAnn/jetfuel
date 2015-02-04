Rails.application.routes.draw do
  root "url#index"

  resources :urls, only: [:index]
end
