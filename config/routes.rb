Rails.application.routes.draw do

  root 'static_pages#home'

  get 'privacy' => 'static_pages#privacy'
  get 'terms_of_use' => 'static_pages#terms_of_use'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'copyright' => 'static_pages#copyright'
  get 'register' => 'static_pages#register'
  get 'sign_in' => 'static_pages#sign_in'


###################### ARTIST #############################

  devise_for :artists, controllers: { sessions: "artists/sessions", passwords: "artists/passwords", registrations: "artists/registrations", confirmations: "artists/confirmations",  unlocks: "artists/unlocks"}

  devise_scope :artist do
    get "sign_out", to: "artists/sessions#destroy"
  end

  resources :artists, controller: 'artists/artists', only: [:show, :index] do
    resource :profile, controller: 'artists/profiles', only: [:edit, :update]
    resources :microposts, controller: 'artists/microposts', only:[:create, :show, :destroy] do
      resources :comments, controller: 'artists/comments', only: [:create, :destroy]
    end
    get 'followers' => 'artists/artists#followers'
  end


  ######################### FAN #############################

  devise_for :fans, controllers: { sessions: "fans/sessions", passwords: "fans/passwords", registrations: "fans/registrations", confirmations: "fans/confirmations",  unlocks: "fans/unlocks"}

  devise_scope :fan do
    get "sign_out", to: "fans/sessions#destroy"
  end

  resources :fans, controller: 'fans/fans', only: [:show, :index] do
    resource :profile, controller: 'fans/profiles', only: [:edit, :update]
    get 'following' => 'fans/fans#following'
  end

  ####################### RECORD LABEL ##########################

  devise_for :record_labels, controllers: { sessions: "recordlabels/sessions", passwords: "recordlabels/passwords", registrations: "recordlabels/registrations", confirmations: "recordlabels/confirmations",  unlocks: "recordlabels/unlocks"}

  devise_scope :record_label do
    get "sign_out", to: "recordlabels/sessions#destroy"
  end

  resources :record_labels, controller: 'recordlabels/recordlabels', only: [:show, :index] do
    resource :profile, controller: 'recordlabels/profiles', only: [:edit, :update]
    resources :microposts, controller: 'recordlabels/microposts', only:[:create, :show, :destroy] do
      resources :comments, controller: 'recordlabels/comments', only: [:create, :destroy]
    end
    get 'followers' => 'recordlabels/recordlabels#followers'
  end

  ###################### VENUE #############################

  devise_for :venues, controllers: { sessions: "venues/sessions", passwords: "venues/passwords", registrations: "venues/registrations", confirmations: "venues/confirmations",  unlocks: "venues/unlocks"}

  devise_scope :venue do
    get "sign_out", to: "venues/sessions#destroy"
  end

  resources :venues, controller: 'venues/venues', only: [:show, :index] do
    resource :profile, controller: 'venues/profiles', only: [:edit, :update]
    resources :microposts, controller: 'venues/microposts', only:[:create, :show, :destroy] do
      resources :comments, controller: 'venues/comments', only: [:create, :destroy]
    end
    get 'followers' => 'venues/venues#followers'
  end

  ###################### PRODUCER #############################

  devise_for :producers, controllers: { sessions: "producers/sessions", passwords: "producers/passwords", registrations: "producers/registrations", confirmations: "producers/confirmations",  unlocks: "producers/unlocks"}

  devise_scope :producer do
    get "sign_out", to: "producers/sessions#destroy"
  end

  resources :producers, controller: 'producers/producers', only: [:show, :index] do
    resource :profile, controller: 'producers/profiles', only: [:edit, :update]
    resources :microposts, controller: 'producers/microposts', only:[:create, :show, :destroy] do
      resources :comments, controller: 'producers/comments', only: [:create, :destroy]
    end
    get 'followers' => 'producers/producers#followers'
  end

  ####################### ADMIN ################################

  devise_for :buffaloes, controllers: { sessions: "buffaloes/sessions", passwords: "buffaloes/passwords", registrations: "buffaloes/registrations", confirmations: "buffaloes/confirmations",  unlocks: "buffaloes/unlocks"}

  devise_scope :buffalo do
    get "sign_out", to: "buffaloes/sessions#destroy"
  end

  resources :posts, controller: 'posts/posts' do
    resources :comments, controller: 'posts/comments', only: [:create, :destroy]
  end

  resources :developers, controller: 'developers/developers' do
    resources :comments, controller: 'developers/comments', only: [:create, :destroy]
  end

  ###################### RELATIONSHIPS #############################

  resources :artist_relationships, controller: 'artists/relationships', only: [:create, :destroy]
  resources :record_label_relationships, controller: 'recordlabels/relationships', only: [:create, :destroy]
  resources :venue_relationships, controller: 'venues/relationships', only: [:create, :destroy]
  resources :producer_relationships, controller: 'producers/relationships', only: [:create, :destroy]

end
