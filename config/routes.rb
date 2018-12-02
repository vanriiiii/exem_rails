Rails.application.routes.draw do
  root to: 'owatters#index'
  resources :owatters do
    collection do
      post :confirm
    end
  end
end
