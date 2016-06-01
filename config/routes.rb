Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "/customers/find", to: "customers#find"
      resources :customers, only: [:index, :show]

      # get "/invoices/find", to: "invoices#find"
      get "/invoices/find", to: "invoices/search#show"
      resources :invoices, only: [:index, :show]


invoices/find?id=1

      get "/invoice_items/find", to: "invoice_items#find"
      resources :invoice_items, only: [:index, :show]
      get "/items/find", to: "items#find"
      resources :items, only: [:index, :show]
      get "/merchants/find", to: "merchants#find"
      resources :merchants, only: [:index, :show]
      get "/transactions/find", to: "transactions#find"
      resources :transactions, only: [:index, :show]
    end
  end
end
