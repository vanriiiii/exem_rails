Rails.application.routes.draw do
  resources :contacts do
    collection do
      post :confirm
    end
  end
end
