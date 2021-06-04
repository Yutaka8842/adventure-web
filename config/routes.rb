Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "rooms#mypage"
  get 'users/show'
  resources :rooms do
    resources :messages
    member do
      get 'mypage',     to: 'rooms#mypage'
      get 'chatroom',   to: 'rooms#chatroom'
      get 'roomsearch', to: 'rooms#roomsearch'
      get 'todo',       to: 'rooms#todo'
      get 'schedule',   to: 'rooms#schedule'
      get 'gallery',    to: 'rooms#gallery'
      post 'join',      to: 'rooms#join'
    end
  end
end
