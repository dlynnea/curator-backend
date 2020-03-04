class ApplicationController < ActionController::API

    before_action :authorized

    def encode_token_and_render_with_user
        secret = Rails.application.secrets.secret_key_base[0]
        payload = {
            user_id: @user.id,
            username: @user.username
        }
        token = JWT.encode(payload, secret)
        render json: { user: UserSerializer.new(@user), token: token }
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        secret = Rails.application.secrets.secret_key_base[0]
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, secret, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
