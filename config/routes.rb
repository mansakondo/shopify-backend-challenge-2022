Rails.application.routes.draw do
  root "inventories#index"

  resources :inventories, except: :show do
    resources :locations
    resources :items, except: :index
    resources :stocks, only: :index
  end
end
