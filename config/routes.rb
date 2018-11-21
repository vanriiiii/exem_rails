Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts do
    collection do
      post :confirm
    end
  end
end
