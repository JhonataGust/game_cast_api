module V1
  module Users
    class UserVideosController < ApplicationController
      before_action :set_video_uid_act, only: %i[update]
      before_action :set_video_uid, only: %i[index show update]

      def index
        @user_videos = UserVideo.where(preference_type: @user.preferences).order('created_at desc')
      end

      def my_video
        @user_videos = UserVideo.where(user_id: @user.id)

        render json: { user_videos: @user_videos }
      end

      def update
        @user_video.update(make_params)
      end

      def create
        @user_video = UserVideo.create(make_params)
      end

      private

      def set_video_uid_act
        @user_video = UserVideo.find_by(uid: params[:uid])

        return render json: { error: 'Id not Found' }, status: 404 if @user_video.nil?
      end

      def set_video_uid
        @current_url = nil
        user_video_default = UserVideo.where(preference_type:  @user.preferences).order('created_at desc')
        @current_url = user_video_default.first.uid
        return if params[:uid] == 'b'

        @current_url = params[:uid].present? ? params[:uid] : user_video_default.first.uid
      end

      def make_params
        video_attr = user_video_params
        video_attr[:user_id] = @user.id
        video_attr
      end

      def user_video_params
        params.require(:user_video).permit(:name, :description, :game_name, :file_video, :thumb, :preference_type)
      end
    end
  end
end
