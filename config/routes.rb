Rails.application.routes.draw do
  resources :ewoks, only: [:index]

  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
