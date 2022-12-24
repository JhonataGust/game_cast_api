Rails.application.routes.draw do
  namespace :v1 do
    post '/users/create', to: 'users#create'
    post '/users/create_session', to: 'users#create_session'

    namespace :users do
      get '/validate', to: 'users#validate'
      get '/', to: 'users#profile'
      put '/', to: 'users#update'
    end
  end
end
