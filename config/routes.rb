Rails.application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    resources :posts do
      collection do
        post :preview
      end
      resources :comments
    end
    resources :sessions
    root 'dashboard#index'
  end


end
