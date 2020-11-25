Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :categories, only: [:index, :show] do
    resources :sub_categories, only: [:index]
  end
  resources :businesses, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create]
  end
end
