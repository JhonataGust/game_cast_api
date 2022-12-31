Rails.application.routes.draw do
  namespace :v1 do
    post '/users/create', to: 'users#create'
    post '/users/create_session', to: 'users#create_session'

    namespace :users do
      get '/validate', to: 'users#validate'
      get '/', to: 'users#profile'
      put '/', to: 'users#update'

      get '/video_users/:uid', to: 'user_videos#index'
      get '/video_users/my_videos', to: 'user_videos#my_video'
      post '/video_users', to: 'user_videos#create'
      put '/video_users/:uid', to: 'user_videos#update'

      post '/video_user_reaction', to: 'user_video_reactions#create_or_update'
    end
  end
end
