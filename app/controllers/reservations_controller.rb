class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservations = Reservation.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new(reservation_params)
    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: "You have added your restaurant!"
    else
      render "/restaurants/show", notice: "We could not add your restaurant."
    end
  end

  def show
    @reservations = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to "/reservations", notice: "Reservation deleted"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:time, :party_size)
  end

end
