Rails.application.routes.draw do
  resources :out_stock_reports
  resources :orders
  resources :cars
  resources :stocks
  resources :car_models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
