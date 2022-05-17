Rails.application.routes.draw do
  resources :inventories, except: :show do
    resources :locations
  end
end
