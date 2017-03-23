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
      flash[:info] = "Gracias por tu compra, favor de realizar el pago correspondiente"   
      redirect_to package_ticket_path(@package, @reservation)
    else
      # redirect_to root_path
    end    
  end

  private

    def ticket_params
      params.require(:reservation).permit(:status, :total, :name, :address, :date, :time, :phone)
    end
end
