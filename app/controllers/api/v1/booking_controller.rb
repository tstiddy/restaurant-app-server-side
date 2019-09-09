class Api::V1::BookingController < ApplicationController

    def create
        booking = Booking.create booking_params
        if booking.valid?
            booking.save
            render json: booking, only: [:id, :user_id, :restaurant_id, :booking_date, :booking_time, :number_of_people], status: :created
        else
            render json: {errors: booking.errors.full_message}, status: :not_accepted
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:user_id, :restaurant_id, :booking_date, :booking_time, :number_of_people)
    end
end
