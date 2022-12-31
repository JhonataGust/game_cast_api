module V1
  module Users
    class UserVideoReactionsController < ApplicationController
      def create_or_update
        @user_video_reaction = UserVideoReaction.find_by(user_id: @user.id,
                                                         reference_id: make_params[:reference_id], reference_type: make_params[:reference_type])

        unless @user_video_reaction.nil?
          @user_video_reaction.destroy
          return
        end

        UserVideoReaction.create(make_params)
      end

      private

      def make_params
        attrs = user_video_reaction_params
        attrs[:user_id] = @user.id
        attrs[:reference_id] = UserVideo.find_by(uid: attrs[:reference_id]).id
        attrs
      end

      def user_video_reaction_params
        params.require(:user_video_reaction).permit(:reference_type, :reference_id)
      end
    end
  end
end
