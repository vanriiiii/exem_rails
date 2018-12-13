Rails.application.routes.draw do
  root to: 'owatters#index'
  resources :owatters do
    collection do
      get :top
      post :confirm
      get :grave
    end
  end
end
