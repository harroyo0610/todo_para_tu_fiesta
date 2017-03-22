class TicketsController < ApplicationController
  def index
<<<<<<< HEAD
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
=======
    p "*"*50
    @details = params
    #@total = (((((params[:persons].to_i * params[:glass_person].to_i)/2)/30*1200)+(params[:persons].to_i *180))+(((params[:persons].to_i * params[:glass_person].to_i)/2)/30*1200)+(params[:persons].to_i*180))
    @total = (((((params[:persons].to_i * params[:glass_person].to_i)/2)/30 * 1200)+(params[:persons].to_i * 180))+(((params[:persons].to_i * params[:glass_person].to_i)/2)/30 * 1200)+(params[:persons].to_i * 180))
    p "v"*50
  end
>>>>>>> e67bc5bf1f2bc2c7dbdfa817d49d58142e5695c5
end
