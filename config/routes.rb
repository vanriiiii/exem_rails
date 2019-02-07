Rails.application.routes.draw do
  root to: 'owatters#top'
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  resources :favorites, only: [:create, :destroy]
  resources :owatters do
    collection do
      get :top
      post :confirm
      get :grave
    end
  end
  resources :sessions, only:[:new, :create, :destroy]
  resources :users
end
