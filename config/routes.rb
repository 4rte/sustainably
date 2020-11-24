Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :categories, only: [:index, :show] do
    resources :sub_categories, only: [:index]
  end
end
