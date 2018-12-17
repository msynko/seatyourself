class ReservationsController < ApplicationController

  before_action :ensure_logged_in
  before_action :load_restaurant
  before_action :load_reservation, only: [:show, :destroy]
  before_action :ensure_user_owns_reservation, only: [:show, :destroy]
  before_action :ensure_user_owns_restaurant, only: [:index]


  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def load_reservation
    @reservation = Reservation.find(params[:id])
  end

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
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to restaurant_path(@restaurant)
      flash[:notice]= "You have added your reservation!"
    else
      redirect_to restaurant_path(@restaurant)
      flash[:notice] = "We could not add your reservation."
    end
  end

  def show
  end

  def destroy
    @reservation.destroy
      redirect_to root_url
      flash[:notice] = "Reservation deleted"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:time, :party_size)
  end

end
