Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :reviews do
      member do
        get :profile
      end
      
    end
  end
  resources :authors do 
    member do
      get :personal_details 
    end
  end
  resources :users do 
    collection { post :import}
  end
  root 'welcome#home'
end
