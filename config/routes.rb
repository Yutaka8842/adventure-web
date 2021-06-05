Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "rooms#mypage"
  resources :users, only: :show
  resources :rooms do
    resources :messages
    member do
      get 'mypage',     to: 'rooms#mypage'
      get 'chatroom',   to: 'rooms#chatroom'
      get 'blankroom',  to: 'rooms#blankroom'
      get 'roomsearch', to: 'rooms#roomsearch'
      get 'todo',       to: 'rooms#todo'
      get 'schedule',   to: 'rooms#schedule'
      get 'gallery',    to: 'rooms#gallery'
      post 'join',      to: 'rooms#join'
      get 'exit',    to: 'rooms#exit'
    end
  end
end
