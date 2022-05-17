Rails.application.routes.draw do
  resources :inventories, except: :show
end
