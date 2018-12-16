class ReservationsController < ApplicationController

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservations = @restaurant.reservations

  end

  def new
    @reservations = Reservation.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new(reservation_params)
    if @reservation.save
      redirect_to restaurant_path(@restaurant)
      flash[:notice]= "You have added your reservation!"
    else
      redirect_to root_url
      flash[:notice] = "We could not add your reservation."
    end
  end

  def show
    @reservations = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
      @reservation.destroy
      redirect_to root_url

     flash[:notice] = "Reservation deleted"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:time, :party_size)
  end

end
