Rails.application.routes.draw do
    resources :users, only:[:new, :create, :show, :index]
    resources :sessions, only:[:new, :create, :destroy]

    get 'signup' => 'users#new', as: 'signup'
    get 'signin' => 'sessions#new', as: 'signin'
    get 'signout' => 'sessions#destroy', as: 'signout'

    root 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
