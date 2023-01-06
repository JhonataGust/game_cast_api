module V1
    module Users
      class VideoCommentsController < ApplicationController
        before_action :set_video_comment, only: [:update]
        
        def index
            @video_comments = VideoComment.all.limit(200)
        end

        def create
            @video_comment = VideoComment.create(make_params)
        end

        private 
        
        def make_params
            params_attr = video_comment_params
            params_attr[:user_id] = @user.id
            params_attr[:user_video_id] = UserVideo.find_by(uid: video_comment_params[:user_video_id])&.id
            params_attr
        end

        def video_comment_params
            params.require(:video_comment).permit(:text_comment, :user_video_id) 
        end
      end
    end
end