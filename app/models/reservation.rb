class Reservation < ApplicationRecord

  validate :restaurant_is_open
  validate :current_capacity


  belongs_to :user
  belongs_to :restaurant


  def restaurant_is_open
    if restaurant.opening_time > self.time.hour || restaurant.closing_time < self.time.hour
      errors[:base] << "Sorry,we're closed!"
    end
  end

  def current_capacity
    restaurant_capacity = restaurant.max_capacity
    current_reservations = restaurant.reservations.where("time = ?", self.time)
    total_current_occupants = 0
    current_reservations.each do |reservation|
      total_current_occupants += reservation.party_size
    end

    if restaurant.max_capacity < total_current_occupants
      errors[:base] << "Reservation not booked. Restaurant at capacity."
      #reservation booking not possible
    end

  end



end
