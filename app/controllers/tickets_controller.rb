class TicketsController < ApplicationController
  

  def index
    p @details = Package.last
    @reservation = Reservation.new
  end
  def create
    @package = Package.last
    @reservation = Reservation.new(ticket_params)
    current_user.reservations << @reservation
    if @reservation.save 
      flash[:info] = "Favor de realizar el pago correspondiente"   
      redirect_to package_ticket_path(@package, @reservation)
      p "+" * 50
      p @reservation
      p @user = current_user
      @user.send_reserv_email
    else
      flash[:info] = "Por favor intenta nuevamente llenando todos los campos requeridos"   
      redirect_to package_tickets_path(@package)
    end    
  end

  private

    def ticket_params
      params.require(:ticket).permit(:name, :address, :date, :time, :phone, :total, :checkbox)
    end
end
