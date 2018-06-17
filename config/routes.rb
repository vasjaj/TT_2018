Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :items
      resources :logs
      root to: "users#index"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  devise_for :users
  get 'items/without_delivery' => 'items#without_delivery', as: :items_without_delivery
  get 'items/without_buy' => 'items#without_buy', as: :items_without_buy
  get 'items/:id/delivery' => 'items#delivery', as: :items_delivery
  get 'items/:id/delivery_refuse' => 'items#delivery_refuse', as: :items_delivery_refuse
  get 'items/:id/buy' => 'items#buy', as: :items_buy
  get 'items/:id/buy_refuse' => 'items#buy_refuse', as: :items_buy_refuse
  get 'users/delivery' => 'users#delivery', as: :users_delivery
  get 'users/buy' => 'users#buy', as: :users_buy
  get 'users/my_items' => 'users#my_items', as: :users_my_items
  resources :items
  #do
  #   collection do
  #     get :delivery
  #   end
  # end
end
