Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get 'video-service',      to: 'pages#video'
  get 'photo-service',      to: 'pages#photo'
  get 'design-service',      to: 'pages#design'
  get 'editorial-service',      to: 'pages#editorial'

  resources :videos

end
