class UsersController < ApplicationController

    skip_before_action :authorized, only: [:index, :create]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def index
        @user = User.all
        render json: @user
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            encode_token_and_render_with_user
        else
            render json: { error: 'Failed to create user' },
                status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

end
