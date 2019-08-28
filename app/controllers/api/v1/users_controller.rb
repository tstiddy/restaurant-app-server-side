class Api::V1::UsersController < ApplicationController

    skip_before_action :set_current_user, only: [:create]

    def create 
        user = User.create( user_params )
        if user.valid?
            render json: { user: UserSerializer.new(user), token: encode_token({user_id: user.id}) }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :not_accepted
        end
    end

    def show
        user = User.find(params[:id])
        render({json: { user: UserSerializer.new(user) }})
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
