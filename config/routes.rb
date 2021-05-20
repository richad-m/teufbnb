Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create, :show]
  end
  resources :bookings, only: [:index]

  patch "bookings/:id", to: "bookings#accept", as: :accept_booking
  patch "bookings/:id", to: "bookings#deny", as: :deny_booking
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
