Rails.application.routes.draw do
    resources :users, only:[:new, :create, :show, :index]
    resources :sessions, only:[:new, :create, :destroy]

    get 'signin' => 'users#new', as: 'signin'
    get 'signout' => 'users#destroy', as: 'signout'

    root 'users#show', {id:1}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
