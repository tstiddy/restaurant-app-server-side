class BookingSerializer < ActiveModel::Serializer
  attributes :id, :booking_date, :booking_time, :number_of_people, :restaurant_id

  def booking_date
    object.booking_date.strftime("%d-%m-%Y")
  end

  def booking_time
    object.booking_time.strftime("%H:%M")
  end
end
