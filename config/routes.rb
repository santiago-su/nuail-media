Rails.application.routes.draw do

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  root to: "pages#home"
  get 'video-service',      to: 'pages#video'
  get 'photo-service',      to: 'pages#photo'
  get 'design-service',     to: 'pages#design'
  get 'editorial-service',  to: 'pages#editorial'
  get 'projects',           to: 'pages#projects'
  get 'nosotros',           to: 'pages#about'

  resources :videos

  resources :photos do
    resources :photo_images
  end

  get 'photos/:id/photo-detail',  to: 'photos#detail', as: 'photo-detail'

  resources :designs do
    resources :design_images
  end

  get 'designs/:id/design-detail',  to: 'designs#detail', as: 'design-detail'

  resources :editorials do
    resources :editorial_images
  end

  get 'editorials/:id/editorial-detail',  to: 'editorials#detail', as: 'editorial-detail'

  get 'contacts',     to: 'contacts#new'
  resources "contacts", only: [:new, :create]

end
