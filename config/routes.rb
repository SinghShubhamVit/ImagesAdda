Rails.application.routes.draw do
  root to: 'image_infos#index'
  devise_for :users
 resources :image_infos
 resources :categories
 resources :sub_categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
