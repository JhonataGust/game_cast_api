module V1 do
  class UsersController < ApplicationController do
    def create
      @user = User.create(user_params)

      return render json: {error: "Missing Field"}, status: 422 unless @user.valid?
    end

    def create_session
      @user = User.find_by(email: user_params[:email])

      if @user.authenticate(user_params[:password])
        JWT.encode({user_id: @user.id}, true)
      end
    end
  end
end
