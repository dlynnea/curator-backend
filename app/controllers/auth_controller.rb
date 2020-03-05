require 'jwt'

class AuthController < ApplicationController

    # skip_before_action :authorized

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
                encode_token_and_render_with_user
            end
        end
    end
end
