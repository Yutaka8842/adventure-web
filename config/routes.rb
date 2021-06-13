Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "rooms#chatroom"
  get 'blankroom',  to: 'rooms#blankroom'
  resources :users, only: :show
  resources :rooms do
    resources :todos
    resources :schedules
    resources :messages
    member do
      get 'mypage',     to: 'rooms#mypage'
      get 'chatroom',   to: 'rooms#chatroom'
      get 'roomsearch', to: 'rooms#roomsearch'
      get 'todo',       to: 'rooms#todo'
      get 'schedule',   to: 'rooms#schedule'
      get 'gallery',    to: 'rooms#gallery'
      post 'join',      to: 'rooms#join'
      get 'exit',    to: 'rooms#exit'
    end
  end
end
