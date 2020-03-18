# frozen_string_literal: true

Rails.application.routes.draw do
  get 'subs/index'
  root to: 'image_infos#index'
  devise_for :users, controllers: {
    registration: 'users/registration', sessions: 'users/sessions', passwords: 'users/passwords'
  }
  resources :users
  resources :image_infos do
    resources :comments
  end
  resources :categories
  resources :sub_categories

  resources :line_items
  resources :carts do
    get 'user_carts', on: :collection, action: :user_carts, as: :user_carts
    get 'checkout', on: :member, action: :checkout, as: :checkout
  end

  get 'categories/sub' => 'categories#sub', as: :sub
  resources :image_infos do
    resources :likes
  end
  get 'your_uploads', to: 'users#your_uploads', as: 'your_uploads'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
