Rails.application.routes.draw do
  mount Motor::Admin => '/motor_admin'
  root "home#index"

  get "/publications/new", to: "publications#new", as: :new_publication # mostrar formulario de crear
  get "/publications", to: "publications#index" # listar todas
  get "/publications/:id", to: "publications#show", as: :publication # Metodo helper para poder referenciarlo en el codigo y no tener que escribir el url
  post "publications", to: "publications#create" # metodo para crear
  get "publications/:id/edit", to: "publications#edit", as: :edit_publication
  patch "publications/:id", to: "publications#update" # metodo para editar
  delete "publications/:id", to: "publications#destroy", as: :delete_publication# metodo para eliminar
  post "comments/:id", to: "comments#create"
  delete "comments/:id", to: "comments#destroy", as: :delete_comments# metodo para eliminar
  
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  namespace :authentication, path:'', as:'' do
    resources :users, only: [:new,:create,:show, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end  
end
