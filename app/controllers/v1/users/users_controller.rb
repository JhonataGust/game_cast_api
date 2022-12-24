module V1
  module Users
    class UsersController < ApplicationController
      before_action :validate_preferences, only: [:update]

      def profile
        @user
      end

      def validate
        render json: { success: 'Key reloaded' }
      end

      def update
        @user.update(user_params)

        return render json: { error: 'Something Went Wrong' }, status: 422 unless @user.valid?

        render json: { success: 'Profile Updated' }
      end

      private

      def validate_preferences
        return if user_params[:preferences].nil?

        return unless user_params[:preferences].count > User.preferences_type.count

        render json: { error: 'Preference Doesnt Exist' },
               status: 422
      end

      def user_params
        params.require(:user).permit(:name, :username, :email, :password, preferences: [])
      end
    end
  end
end
