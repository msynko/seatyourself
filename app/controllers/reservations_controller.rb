class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservations = Reservation.new
  end

  def show
    @reservations = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to "/reservations", notice: "Reservation deleted"
  end

end
