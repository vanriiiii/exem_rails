Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets do
    collection do
      post :confirm
    end
  end
end
