class PackagesController < ApplicationController
  
  def new
    @package = Package.new
  end


  def index
    @package = Package.new
  end

  def create
    user_package = package_params
    if params[:package][:type] == "1" 
      @total = (((user_package[:persons].to_i * user_package[:glass_person].to_i)/2)/30 * 1200)+(user_package[:persons].to_i * 180)
    elsif params[:package][:type] == "2"
      @total = (((user_package[:persons].to_i * user_package[:glass_person].to_i)/2)/30 * 1200)
    elsif params[:package][:type] == "3"
      @total = (user_package[:persons].to_i * 180)
    end
    @package = Package.new(package_params)
<<<<<<< HEAD
    @package.update(total: total)
    if !logged_in? 
      flash[:danger] = "para continuar necesitas registrarte o iniciar una sessión"
=======
    @package.update(total: @total)

    if logged_in? && @package.save 
      redirect_to package_tickets_path(@package)
    else
>>>>>>> c288aab1a0d56fee3403ad6651650cda2c8140ec
      redirect_to login_url
    elsif !@package.save
         render 'index'  
    else
        redirect_to package_tickets_path(@package)
    end    
  end

  private

    def package_params
<<<<<<< HEAD
      params.require(:package).permit!
=======
      params.require(:package).permit(:persons, :glass_person, :size, :meat)
>>>>>>> c288aab1a0d56fee3403ad6651650cda2c8140ec
    end
end
