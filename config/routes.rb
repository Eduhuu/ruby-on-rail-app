Rails.application.routes.draw do
  root "home#index"
  get "/publications", to: "publications#index"
end
