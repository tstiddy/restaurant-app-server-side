class Api::V1::FavoriteController < ApplicationController

    def create
        favorite = Favorite.create favorite_params
        if favorite.valid?
            favorite.save
            render json: favorite, only: [:id, :user_id, :restaurant_id], status: :created
        else
            render json: {errors: favorite.errors.full_message}, status: :not_accepted
        end
    end

    private 

    def favorite_params
        params.require(:favorite).permit(:user_id, :restaurant_id)
    end
end
