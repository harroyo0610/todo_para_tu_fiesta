class TicketsController < ApplicationController
  def index
    p "*"*50
    @details = params
    #@total = (((((params[:persons].to_i * params[:glass_person].to_i)/2)/30*1200)+(params[:persons].to_i *180))+(((params[:persons].to_i * params[:glass_person].to_i)/2)/30*1200)+(params[:persons].to_i*180))
    @total = (((((params[:persons].to_i * params[:glass_person].to_i)/2)/30 * 1200)+(params[:persons].to_i * 180))+(((params[:persons].to_i * params[:glass_person].to_i)/2)/30 * 1200)+(params[:persons].to_i * 180))
    p "v"*50
  end
end
