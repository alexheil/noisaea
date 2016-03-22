Rails.application.routes.draw do

  root 'static_pages#home'

  get 'privacy' => 'static_pages#privacy'
  get 'terms_of_use' => 'static_pages#terms_of_use'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'copyright' => 'static_pages#copyright'
  get 'stats' => 'static_pages#stats'
  get 'why' => 'static_pages#why'
  get 'contest' => 'static_pages#contest'
  get 'register' => 'static_pages#register'
  get 'sign_in' => 'static_pages#sign_in'


###################### ARTIST #############################

  devise_for :artists, controllers: { sessions: "artists/sessions", passwords: "artists/passwords", registrations: "artists/registrations", confirmations: "artists/confirmations",  unlocks: "artists/unlocks"}

  devise_scope :artist do
    get "sign_out", to: "artists/sessions#destroy"
  end

  resources :artists, controller: 'artists/artists', only: [:show, :index] do
    resource :profile, controller: 'artists/profiles', only: [:edit, :update]
    resources :relationships, controller: 'artists/relationships', only: [:create, :destroy]
    resources :notifications, controller: 'artists/notifications', only: [:index, :update]
    resources :microposts, controller: 'artists/microposts', path: :status, only:[:create, :show, :destroy] do
      resources :votes, controller: 'artists/micropost_votes', only: [:create,:destroy]
      resources :comments, controller: 'artists/comments', only: [:create, :destroy] do
        resources :votes, controller: 'artists/comment_votes', only: [:create,:destroy]
      end
    end
    resources :albums, controller: 'artists/albums' do
      resources :tracks, controller: 'artists/tracks', except: :index
    end
    resources :merches, controller: 'artists/merches', path: :merch
    resources :shows, controller: 'artists/shows'
    resources :videos, controller: 'artists/videos'
    get 'followers' => 'artists/artists#followers'
  end

  get 'index_artist_microposts' => 'artists/artists#microposts', path: :artist_timeline
  get 'index_artist_merch' => 'artists/artists#merch', path: :artist_merch
  get 'index_artist_shows' => 'artists/artists#shows', path: :artist_shows
  get 'index_artist_videos' => 'artists/artists#videos', path: :artist_videos

  ######################### FAN #############################

  devise_for :fans, controllers: { sessions: "fans/sessions", passwords: "fans/passwords", registrations: "fans/registrations", confirmations: "fans/confirmations",  unlocks: "fans/unlocks"}

  devise_scope :fan do
    get "sign_out", to: "fans/sessions#destroy"
  end

  resources :fans, controller: 'fans/fans', only: [:show, :index] do
    resource :profile, controller: 'fans/profiles', only: [:edit, :update]
    get 'following' => 'fans/fans#following'
    get 'music' => 'fans/fans#music'
    get 'merch' => 'fans/fans#merch'
    get 'shows' => 'fans/fans#shows'
    get 'videos' => 'fans/fans#videos'
  end

  ####################### RECORD LABEL ##########################

  devise_for :record_labels, controllers: { sessions: "recordlabels/sessions", passwords: "recordlabels/passwords", registrations: "recordlabels/registrations", confirmations: "recordlabels/confirmations",  unlocks: "recordlabels/unlocks"}

  devise_scope :record_label do
    get "sign_out", to: "recordlabels/sessions#destroy"
  end

  resources :record_labels, controller: 'recordlabels/recordlabels', only: [:show, :index] do
    resource :profile, controller: 'recordlabels/profiles', only: [:edit, :update]
    resources :relationships, controller: 'recordlabels/relationships', only: [:create, :destroy]
    resources :microposts, controller: 'recordlabels/microposts', path: :status, only:[:create, :show, :destroy] do
      resources :votes, controller: 'recordlabels/micropost_votes', only: [:create,:destroy]
      resources :comments, controller: 'recordlabels/comments', only: [:create, :destroy] do
        resources :votes, controller: 'recordlabels/comment_votes', only: [:create,:destroy]
      end
    end
    resources :shows, controller: 'recordlabels/shows'
    resources :videos, controller: 'recordlabels/videos'
    get 'followers' => 'recordlabels/recordlabels#followers'
  end

  ###################### VENUE #############################

  devise_for :venues, controllers: { sessions: "venues/sessions", passwords: "venues/passwords", registrations: "venues/registrations", confirmations: "venues/confirmations",  unlocks: "venues/unlocks"}

  devise_scope :venue do
    get "sign_out", to: "venues/sessions#destroy"
  end

  resources :venues, controller: 'venues/venues', only: [:show, :index] do
    resource :profile, controller: 'venues/profiles', only: [:edit, :update]
    resources :relationships, controller: 'venues/relationships', only: [:create, :destroy]
    resources :microposts, controller: 'venues/microposts', path: :status, only:[:create, :show, :destroy] do
      resources :votes, controller: 'venues/micropost_votes', only: [:create,:destroy]
      resources :comments, controller: 'venues/comments', only: [:create, :destroy] do
        resources :votes, controller: 'venues/comment_votes', only: [:create,:destroy]
      end
    end
    resources :shows, controller: 'venues/shows'
    resources :videos, controller: 'venues/videos'
    get 'followers' => 'venues/venues#followers'
  end

  ###################### PRODUCER #############################

  devise_for :producers, controllers: { sessions: "producers/sessions", passwords: "producers/passwords", registrations: "producers/registrations", confirmations: "producers/confirmations",  unlocks: "producers/unlocks"}

  devise_scope :producer do
    get "sign_out", to: "producers/sessions#destroy"
  end

  resources :producers, controller: 'producers/producers', only: [:show, :index] do
    resource :profile, controller: 'producers/profiles', only: [:edit, :update]
    resources :relationships, controller: 'producers/relationships', only: [:create, :destroy]
    resources :microposts, controller: 'producers/microposts', path: :status, only:[:create, :show, :destroy] do
      resources :votes, controller: 'producers/micropost_votes', only: [:create,:destroy]
      resources :comments, controller: 'producers/comments', only: [:create, :destroy] do
        resources :votes, controller: 'producers/comment_votes', only: [:create,:destroy]
      end
    end
    resources :videos, controller: 'producers/videos'
    get 'followers' => 'producers/producers#followers'
  end

  ####################### ADMIN ################################

  devise_for :buffaloes, controllers: { sessions: "buffaloes/sessions", passwords: "buffaloes/passwords", registrations: "buffaloes/registrations", confirmations: "buffaloes/confirmations",  unlocks: "buffaloes/unlocks"}

  devise_scope :buffalo do
    get "sign_out", to: "buffaloes/sessions#destroy"
  end

  resources :posts, controller: 'posts/posts' do
    resources :comments, controller: 'posts/comments', only: [:create, :destroy] do
      resources :votes, controller: 'posts/comment_votes', only: [:create,:destroy]
    end
  end

  resources :developers, controller: 'developers/developers' do
    resources :comments, controller: 'developers/comments', only: [:create, :destroy] do
      resources :votes, controller: 'developers/comment_votes', only: [:create,:destroy]
    end
  end

end
