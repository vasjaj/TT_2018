Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :items

      root to: "users#index"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  devise_for :users
  get 'items/:id/delivery' => 'items#delivery', as: :items_delivery
  get 'items/:id/delivery_refuse' => 'items#delivery_refuse', as: :items_delivery_refuse
  get 'users/delivery' => 'users#delivery', as: :users_delivery
  resources :items
  #do
  #   collection do
  #     get :delivery
  #   end
  # end
end
