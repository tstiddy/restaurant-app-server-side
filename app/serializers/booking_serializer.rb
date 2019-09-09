class BookingSerializer < ActiveModel::Serializer
  attributes :id, :bookingDate, :bookingTime, :number_of_people, :restaurant_id

  def bookingDate
    object.booking_date.strftime("%d-%m-%Y")
  end

  def bookingTime
    object.booking_time.strftime("%H:%M")
  end
end
