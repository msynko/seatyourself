class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
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

    if @restaurant.save
      redirect_to product_path(@restaurant), notice: "You have added your restaurant!"
    else
      render :new, notice: "We could not add your restaurant"
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.name = params[:restaurant][:name]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.phone_number = params[:restaurant][:phone_number]
    @restaurant.price_range = params[:restaurant][:price_range]
    @restaurant.max_capacity = params[:restaurant][:max_capacity]
    @restaurant.opening_time = params[:restaurant][:opening_time]
    @restaurant.closing_time = params[:restaurant][:closing_time]
    @restaurant.menu = params[:restaurant][:menu]

    if @restaurant.save
      redirect_to product_path(@restaurant), notice: "You have added your restaurant!"
    else
      render :new, notice: "We could not add your restaurant"
    end
  end

  def destroy
    @restaurant= Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to "/restaurants", notice: "Restaurant deleted"
  end

end
