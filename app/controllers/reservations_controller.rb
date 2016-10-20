class ReservationsController < ApplicationController

  before_action :require_login, only: [:new, :create]
  #i make sure i log in first before i manage to create new reservation under any public listings

  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def create

    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      redirect_to @listing
    else
      render :new
    end

  end


  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :listing_id)
  end
end
