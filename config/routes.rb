Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'pages#home'
  resources :categories, only: [:index, :show] do
    resources :sub_categories, only: [:index]
  end
  resources :businesses, only: [:index, :show, :new, :create, :edit, :destroy] do
    resources :reviews, only: [:create]
    resources :bookmarks, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]
  resources :bookmarks, only: [ :index, :destroy ]
end
