Rails.application.routes.draw do
  resources :url_items

  root "home#index"
end
