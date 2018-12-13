Rails.application.routes.draw do
  root to: 'owatters#top'
  resources :owatters do
    collection do
      get :top
      post :confirm
      get :grave
    end
  end
end
