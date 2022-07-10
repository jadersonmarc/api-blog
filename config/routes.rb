Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
      post :auth, to: "authentication#create"
      namespace :articles, path: "/" do
        resources :articles
      end
  end

  root to: "api/articles/articles#index"
end
