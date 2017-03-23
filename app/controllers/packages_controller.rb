class PackagesController < ApplicationController
  
  def new
    @package = Package.new
  end


  def index
    @package = Package.new
  end

  def create
    user_package = package_params
    total = (((((user_package[:persons].to_i * user_package[:glass_person].to_i)/2)/30 * 1200)+(user_package[:persons].to_i * 180))+(((user_package[:persons].to_i * user_package[:glass_person].to_i)/2)/30 * 1200)+(user_package[:persons].to_i * 180))
    @package = Package.new(package_params)
    @package.update(total: total)
    if !logged_in? 
      flash[:danger] = "para continuar necesitas registrarte o iniciar una sessión"
      redirect_to login_url
    elsif !@package.save
         render 'index'  
    else
        redirect_to package_tickets_path(@package)
    end    
  end

  private

    def package_params
      params.require(:package).permit!
    end
end
