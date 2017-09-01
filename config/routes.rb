Rails.application.routes.draw do

  root "posts#index"
  resources :posts

  resources :tweets, only: [:index] do
    collection do
      get 'post'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
