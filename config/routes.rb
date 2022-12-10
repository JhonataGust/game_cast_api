Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    post '/user/create', to: 'users#create'
    post '/user/create_session', to: 'users#create_session'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
