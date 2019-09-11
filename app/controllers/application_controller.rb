class ApplicationController < ActionController::API

    before_action :set_current_user

    protect_from_forgery
    before_filter :cors_preflight_check
    after_filter :cors_set_access_control_headers

    def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With auth_token payload}.join(',')}
        headers['Access-Control-Max-Age'] = "1728000"
    end

    def cors_preflight_check
        if request.method == "OPTIONS"
          headers['Access-Control-Allow-Origin'] = 'http://localhost'
          headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
          headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With auth_token payload}.join(',')
          headers['Access-Control-Max-Age'] = '1728000'
          render :text => '', :content_type => 'text/plain'
        end
      end

    def encode_token(payload)
        JWT.encode(payload, ENV['RAILS_SECRET'])
    end

    def decode_token(token)
        JWT.decode(token, ENV['RAILS_SECRET'])[0]
    end

    def get_token
        request.headers["Authorization"] || request.headers["Authorisation"]
    end

    def set_current_user
        token = get_token
        if token
            decoded_token = decode_token(token)
            @current_user = User.find(decoded_token["user_id"])
        else
            @current_user = nil
        end
    end

    def logged_in
        !!@current_user
    end
end
