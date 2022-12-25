module V1
    module Users
      class UserVideosController < ApplicationController
        before_action :set_video_uid
        def index
            @user_videos = UserVideo.where(preference_type: @user.preferences) 
        end

        def update
            @user_videos.update(make_params)
        end
        def create
            @user_videos = UserVideo.create(make_params)
        end

        private

        def set_video_uid
            user_video_default = UserVideo.where(preference_type: @user.preferences) 
            @current_url = params[:uid].present? ? params[:uid] : user_video_default.first.uid
        end
        
        def make_params
            video_attr = user_video_params
            video_attr[:user_id] = @user.id
            video_attr
        end
        
        def user_video_params
            params.require(:user_video).permit(:name, :description, :file_video)
        end
      end
    end
end