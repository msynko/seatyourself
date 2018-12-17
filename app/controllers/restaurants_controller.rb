class RestaurantsController < ApplicationController

  before_action :ensure_logged_in, except: [:index, :show]
  before_action :load_restaurant, except: [:new, :create, :index]
  before_action :ensure_user_owns_restaurant, only: [:edit, :update, :destroy]

  def load_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new
    @restaurant.name = params[:restaurant][:name]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.phone_number = params[:restaurant][:phone_number]
    @restaurant.price_range = params[:restaurant][:price_range]
    @restaurant.max_capacity = params[:restaurant][:max_capacity]
    @restaurant.opening_time = params[:restaurant][:opening_time]
    @restaurant.closing_time = params[:restaurant][:closing_time]
    @restaurant.menu = params[:restaurant][:menu]
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
      flash[:notice] = "You have added your restaurant!"
    else
      render :new
      flash[:notice] = "We could not add your restaurant"
    end
  end

  def edit
  end

  def update
    @restaurant.name = params[:restaurant][:name]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.phone_number = params[:restaurant][:phone_number]
    @restaurant.price_range = params[:restaurant][:price_range]
    @restaurant.max_capacity = params[:restaurant][:max_capacity]
    @restaurant.opening_time = params[:restaurant][:opening_time]
    @restaurant.closing_time = params[:restaurant][:closing_time]
    @restaurant.menu = params[:restaurant][:menu]

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
       flash[:notice] = "You have updated your restaurant!"
    else
      render :new
      flash[:notice] = "We could not add your restaurant"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to "/restaurants"
    flash[:notice] = "Restaurant deleted"
  end

end
