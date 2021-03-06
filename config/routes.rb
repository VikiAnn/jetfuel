require "resque/server"

Rails.application.routes.draw do
  root "urls#index"

  resources :urls, only: [:index, :new, :create]
  resources :urls, path: "",  param: :slug, only: [:show]

  mount Resque::Server.new, at: "/job/resque"
end
