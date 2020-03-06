Rails.application.routes.draw do
  get 'subs/index'
  root to: 'image_infos#index'
  devise_for :users, controllers: { registration: 'users/registration', sessions: 'users/sessions',passwords: 'users/passwords'}
 resources :users   
 resources :image_infos do
 	resources :comments
 end
 resources :categories
 resources :sub_categories

 get "categories/sub" => "categories#sub", as: :sub
 # resources :image_infos do
  # resources :likes
  post 'like/:id' , to:'likes#create' , as:'like' 
  get  'your_uploads', to: 'users#your_uploads' , as: 'your_uploads'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
