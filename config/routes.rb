Rails.application.routes.draw do
  resources :inventories, except: :show do
    resources :locations
    resources :items, except: :index
  end
end
