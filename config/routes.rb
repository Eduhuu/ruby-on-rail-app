Rails.application.routes.draw do
  root "home#index"
  get "/publications/new", to: "publications#new", as: :new_product
  get "/publications", to: "publications#index"
  get "/publications/:id", to: "publications#show", as: :publication # Metodo helper para poder referenciarlo en el codigo y no tener que escribir el url
  post "publications", to: "publications#create"

  namespace :authentication, path:'', as:'' do
    resources :users, only: [:new,:create]
    resources :sessions, only: [:new, :create]
  end  

end
