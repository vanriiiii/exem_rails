Rails.application.routes.draw do
  root to: 'owatters#top'

  resources :sessions, only:[:new, :create, :destroy]
  
  resources :users

  resources :owatters do
    collection do
      get :top
      post :confirm
      get :grave
    end
  end

end
