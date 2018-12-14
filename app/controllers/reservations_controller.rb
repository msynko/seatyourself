class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservations = Reservation.new
  end

  def create
    @reservation = Reservation.new
    @reservation.time = params[:reservation][:time]
    @reservation.party_size = params[:reservation][:party_size]
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation.restaurant= @restaurant
    if @reservation.save
      redirect_to restaurant_path(@reservation), notice: "You have added your restaurant!"
    else
      render :new, notice: "We could not add your restaurant"
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

end
