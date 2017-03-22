class TicketsController < ApplicationController
  def index
    @details = Package.last
    @reservation = Reservation.new
  end
  def create
    @package = Package.last
    @reservation = Reservation.new(ticket_params)
    current_user.reservations << @reservation
    if @reservation.save      
      redirect_to package_ticket_path(@package, @reservation)
    else
      # redirect_to root_path
    end    
  end

  private

    def ticket_params
      params.require(:ticket).permit(:status, :total, :name, :address, :date, :time, :phone, :checkbox)
    end
end
