Rails.application.routes.draw do
    resources :users, only:[:new, :create, :destroy, :show, :index]
    resources :events

    get 'signin' => 'users#new', as: 'signin'
    get 'signout' => 'users#destroy', as: 'signout'
    
    get 'attend' => 'events#attend', as: 'attend'

    root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
