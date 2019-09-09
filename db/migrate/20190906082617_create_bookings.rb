class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.integer :restaurant_id
      t.datetime :booking_date
      t.datetime :booking_time
      t.integer :number_of_people

      t.timestamps
    end
  end
end
