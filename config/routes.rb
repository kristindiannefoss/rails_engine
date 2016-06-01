Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      # get "/invoices/find", to: "invoices#find"
      # get "/invoices/find", to: "invoices/search#show"

      namespace :customers do
        get "/find", to: "search#show"
      end
      resources :customers, only: [:index, :show]

      namespace :invoices do
        get "/invoices/find", to: "invoices/search#show"
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        get "/invoice_items/find", to: "invoice_items/search#show"
      end
      resources :invoice_items, only: [:index, :show]

      namespace :items do
        get "/items/find", to: "items/search#show"
      end
      resources :items, only: [:index, :show]

      namespace :merchants do
        get "/merchants/find", to: "merchants/search#show"
      end
      resources :merchants, only: [:index, :show]

      namespace :transactions do
        get "/transactions/find", to: "transactions/earch#show"
      end
      resources :transactions, only: [:index, :show]

    end
  end
end
