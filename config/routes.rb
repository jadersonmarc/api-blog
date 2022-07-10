Rails.application.routes.draw do
  devise_for :users
  as :user do
    post "api/registrations" => "api/registrations#create", as: "create_registrations"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :sessions, only: [:new]
    resources :registrations, only: [:create]
      namespace :articles, path: "/" do
        resources :articles
      end
  end

  root to: "api/articles/articles#index"
end
