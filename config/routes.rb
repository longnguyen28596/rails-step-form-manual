Rails.application.routes.draw do
  namespace :register do
    namespace :step1 do
      resources :users, except: [:index, :destroy]
    end
    namespace :step2 do
      resources :users, only: [:edit, :update]
    end
    namespace :step3 do
      resources :users, only: [:edit, :update]
    end
  end
end
