module V1
  class UsersController < ApplicationController
    before_action :validate_email, only: %i[create]

    def create
      @user = User.create(user_params)

      token = encode_token({ user_id: @user.id })

      return render json: { error: 'Empty Fields are not allowed' }, status: 422 unless @user.valid?

      render json: { user: @user, token: token }
    end

    def create_session
      @user = User.find_by(email: user_params[:email])

      if @user && @user.authenticate(user_params[:password])

        token = encode_token({ user_id: @user.id })

        render json: { user: @user, token: token }
      else
        render json: { error: 'Email or Password incorrect' }, status: 404
      end
    end

    private

    def validate_email
      user_exist = User.find_by(email: user_params[:email])

      return render json: { error: 'E-mail already exists' }, status: 404 unless user_exist.nil?
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :username)
    end
  end
end
