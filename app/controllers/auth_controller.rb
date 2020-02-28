require 'jwt'

class AuthController < ApplicationController

    skip_before_action :authorized

    def login

        username = params[:username]
        password = params[:password]

        @user = User.find_by username: username
        
        if !@user
            render status: :unauthorized
        else
            if !@user.authenticate password
                render status: :unauthorized
            else
                secret = Rails.application.secrets.secret_key_base[0]
                payload = {
                    user_id: @user.id,
                    username: @user.username
                }
                token = JWT.encode(payload, secret)
                render json: { user: UserSerializer.new(@user), token: token }
            end
        end
    end
end
