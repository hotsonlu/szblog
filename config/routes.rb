Rails.application.routes.draw do
  root 'blogs#index'

  namespace :admin do
    resources :posts do
      collection do
        post :preview
      end
      resources :comments
    end
    resources :sessions

    get 'dashboard/index'

  end

  resources :blogs do
    resources :comments
    resource :like,  module: :blogs
  end

end
